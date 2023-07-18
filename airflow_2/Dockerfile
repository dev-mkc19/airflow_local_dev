FROM --platform=$BUILDPLATFORM apache/airflow:2.3.4-python3.8
ARG BUILDPLATFORM
RUN echo "Current build platform is $BUILDPLATFORM"
WORKDIR $AIRFLOW_HOME

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r requirements.txt; \
    umask 0002; 
