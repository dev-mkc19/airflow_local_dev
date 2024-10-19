FROM apache/airflow:2.5.3-python3.9
WORKDIR $AIRFLOW_HOME

USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  && apt-get install -y vim \
  && apt-get install -y git \
  # trino client has to install backports.zoneinfo which require bin lib below
    build-essential gcc \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r requirements.txt; \
    umask 0002; 
