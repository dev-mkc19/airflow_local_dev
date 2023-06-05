FROM --platform=$BUILDPLATFORM apache/airflow:2.3.4-python3.8
ARG BUILDPLATFORM
RUN echo "Current build platform is $BUILDPLATFORM"
WORKDIR $AIRFLOW_HOME

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt; \
    umask 0002; 
