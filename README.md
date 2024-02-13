# Setting up Airflow in Docker

## DESCRIPTION

This repo has aim to quickly and easily start Airflow 1/2 in container for local developing purposes.
(write DAGs, fix errors, test functionality).

## QUICK START

1. Make sure [Colima](https://github.com/abiosoft/colima/blob/main/README.md) has already installed on you Mac.
2. Then make sure docker CLI is also has installed `brew install docker docker-compose kubectl kubectx`
3. Then type `make start version=<VERSION>` and see the magic!
4. Go to url `http://localhost:8081` (`8082` for 2 instance) and see WebUI. Done.

~~Shit~~ Fails happens and magic might not came, be ready for that :)

## USAGE

For easier start there is make file with general command. Those commands are aliases of subcommands.
To start airflow just type command and version of airflow which you want.

Example: `make start version=1`

> Note: You can disable showing Docker Desktop in settings: \
> Docker Dashboard -> Settings -> General -> remove tick on "Open Docker Dashboard at startup"

To stop airflow just type command and version of airflow which you want.

Example: `make stop version=1`

## CONFIGURATION

1. Make sure Colima engine has at least 5Gb memory of resources
2. Set path to your google `application_default_credentials.json` in docker-compose files
3. Set path to your airflow content via .env file
4. Set up desired connections via WEB UI or CLI by entering `docker exec -it <CONTAINER_NAME> bash` command

    ```bash
    airflow connections add \
        <CONNECTION_ID> \
        --conn-type '<CONNECTION_TYPE>' \
        --conn-login '<LOGIN>' \
        --conn-password '<PASSWORD>' \
        --conn-schema '<SCHEMA>' \
        --conn-port '<PORT>' \
        --conn-host '<HOST>'
    ```
