FROM apache/airflow:3.2.2-python3.13
WORKDIR $AIRFLOW_HOME

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r requirements.txt; \
