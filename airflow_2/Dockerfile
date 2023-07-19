FROM --platform=$BUILDPLATFORM apache/airflow:2.3.4-python3.8
ARG BUILDPLATFORM
RUN echo "Current build platform is $BUILDPLATFORM"
WORKDIR $AIRFLOW_HOME

USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  && apt-get install -y vim \
  # trino client has to install backports.zoneinfo which require bin lib below
    build-essential gcc \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt; \
    umask 0002; 
