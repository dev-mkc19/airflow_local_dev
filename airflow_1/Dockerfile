FROM apache/airflow:2.3.4-python3.8
WORKDIR $AIRFLOW_HOME

COPY trino-jdbc-409.jar ${AIRFLOW_HOME}/jdbc_drivers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt; \
    umask 0002; 
