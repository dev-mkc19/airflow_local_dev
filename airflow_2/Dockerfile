FROM apache/airflow:2.3.0-python3.10
WORKDIR $AIRFLOW_HOME

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt; \
    umask 0002; 
