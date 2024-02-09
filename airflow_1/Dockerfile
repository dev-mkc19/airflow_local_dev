FROM apache/airflow:2.3.4-python3.8
WORKDIR $AIRFLOW_HOME

# switch to root user for enabling to install deps for re-compilation py packages
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  # trino client has to install backports.zoneinfo which require bin lib below
    build-essential gcc \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow

COPY trino-jdbc-409.jar ${AIRFLOW_HOME}/jdbc_drivers
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r requirements.txt; \
    umask 0002; 
