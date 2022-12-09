FROM apache/airflow:2.2.5-python3.8
WORKDIR $AIRFLOW_HOME

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt; \
    umask 0002; 
