# Setting up Airflow in Docker

## DESCRIPTION

This repo has aim to qiuqly and easily start Airflow 1/2 in container for local developing purposes.
(write DAGs, fix errors, test functionality).

## USAGE

1. Make sure [Docker desktop](https://www.docker.com) has already installed on you Mac.
2. Then type `make start version=<VERSION>` and see the magic!

~~Shit~~ Fails happens and magic might not came, be ready for that :)

## CONFIGUTATION

1. Set path to your airflow content via .env file
2. Set up desired connections via WEB UI or CLI by entering ` docker exec -it <CONTAINER_NAME> bash` command
    airflow connections --add \
        --conn_id '<CONNECTION_ID>' \
        --conn_type '<CONNECTION_TYPE>' \
        --conn_login '<LOGIN>' \
        --conn_password '<PASSWORD>' \
        --conn_schema '<SCHEMA>' \
        --conn_port '<PORT>' \
        --conn_host '<HOST>'
