FROM apache/airflow:1.10.15-python3.8
ARG AIRFLOW_USER_HOME=/opt/airflow

COPY script/entrypoint.sh /entrypoint.sh
COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg
COPY presto-jdbc-344.jar ${AIRFLOW_USER_HOME}/jdbc_drivers

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# RUN chown -R airflow: ${AIRFLOW_USER_HOME}

EXPOSE 8080 5555 8793 5678

USER airflow

WORKDIR ${AIRFLOW_USER_HOME}
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]
