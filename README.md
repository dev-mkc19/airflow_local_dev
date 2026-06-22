# Локальный Airflow в Docker

Репозиторий для быстрого запуска Airflow 1, 2 или 3 в контейнерах на macOS. Подходит для локальной разработки: написание DAG'ов, отладка ошибок, проверка функциональности.

Каждая версия Airflow живёт в отдельной папке со своим `Dockerfile`, `docker-compose` и `.env`.

## Версии и порты

| Версия | Airflow | Executor      | Web UI              | Логин по умолчанию |
|--------|---------|---------------|---------------------|--------------------|
| 1      | 2.3.4   | LocalExecutor | http://localhost:8081 | admin / admin  |
| 2      | 2.5.3   | LocalExecutor | http://localhost:8082 | admin / admin  |
| 3      | 3.2.2   | CeleryExecutor| http://localhost:8083 | airflow / airflow |

## Быстрый старт

### Требования

1. [Colima](https://github.com/abiosoft/colima) — Docker-движок для macOS
2. Docker CLI и Docker Compose:

```bash
brew install docker docker-compose
```

### Запуск

```bash
make start version=2
```

Команда автоматически:
- запускает Colima (4 CPU, 8 GB RAM);
- собирает Docker-образ `airflow_local_dev_<version>`;
- поднимает контейнеры через `docker-compose`.

Откройте Web UI по адресу из таблицы выше.

> Не всё может завестись с первого раза — проверьте раздел [Конфигурация](#конфигурация) и логи контейнеров.

## Команды Makefile

| Команда | Описание |
|---------|----------|
| `make start version=<N>` | Собрать образ и запустить Airflow |
| `make stop version=<N>`  | Остановить контейнеры |
| `make compile version=<N>` | Только собрать Docker-образ |
| `make clean version=<N>` | Удалить образ, логи и кэш Python |
| `make quit`              | Остановить Colima |

Примеры:

```bash
make start version=1
make stop version=3
make clean version=2
```

## Конфигурация

### 1. Ресурсы Colima

Makefile запускает Colima с **4 CPU** и **8 GB RAM**. Для Airflow 3 (CeleryExecutor + Redis + Worker) этого минимум достаточно. При нехватке памяти увеличьте параметры в `Makefile` или запустите Colima вручную:

```bash
colima start --cpu 4 --memory 8
```

### 2. Путь к контенту Airflow (DAG'и, скрипты, логи)

Перед первым запуском создайте файл `.env` в папке нужной версии.

**Airflow 1** — `airflow_1/.env`:

```env
AIRFLOW_UID=502
AIRFLOW_1_CONTENT_FOLDER=/path/to/your/airflow/content
```

**Airflow 2** — `airflow_2/.env`:

```env
AIRFLOW_UID=502
AIRFLOW_2_CONTENT_FOLDER=/path/to/your/airflow/content
```

**Airflow 3** — `airflow_3/.env`:

```env
AIRFLOW_UID=502
AIRFLOW_PROJ_DIR=/path/to/your/airflow/content
FERNET_KEY=<ваш-fernet-key>
```

> **Важно:** переменные вроде `AIRFLOW_2_CONTENT_FOLDER` и `AIRFLOW_PROJ_DIR` используются Docker Compose для подстановки путей в `volumes` (`${...}` в `docker-compose.yml`). Они должны быть в файле `.env` в папке соответствующей версии, а не только в `env_file` внутри compose-файла.

### 3. Google Cloud credentials (только Airflow 1)

В `airflow_1/docker-compose.airflow_1.yml` смонтирован файл:

```
/Users/<USER>/.config/gcloud/application_default_credentials.json
```

Убедитесь, что файл существует, или измените путь в compose-файле.

### 4. Переменные и connections

Дополнительные переменные (`AIRFLOW_VAR_*`, `AIRFLOW_CONN_*` и т.д.) задаются в `.env` соответствующей версии. Они передаются в контейнеры через `env_file`.

Connections можно также настроить через Web UI или CLI:

```bash
docker exec -it airflow_local_dev_2-airflow-webserver-1 bash

airflow connections add \
    <CONNECTION_ID> \
    --conn-type '<CONNECTION_TYPE>' \
    --conn-login '<LOGIN>' \
    --conn-password '<PASSWORD>' \
    --conn-schema '<SCHEMA>' \
    --conn-port '<PORT>' \
    --conn-host '<HOST>'
```
