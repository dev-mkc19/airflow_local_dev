# airflow version to operate with
version = 
version = $(version)

prepare:
	/opt/homebrew/bin/colima start

# Build image
compile: prepare
	/opt/homebrew/bin/docker build -t airflow_local_dev_$(version) ./airflow_$(version)

# Start containers from build image
start: compile
	/opt/homebrew/bin/docker-compose -f "docker-compose.airflow_$(version).yml" -p airflow_local_dev_$(version) up -d 

# Stop containers and close the app
stop:
	/opt/homebrew/bin/docker-compose -f "docker-compose.airflow_$(version).yml" -p airflow_local_dev_$(version) down

quit:
	/opt/homebrew/bin/colima stop

# Remove all compiled staff
clean:
# || true is used for suppress errors if occured
	docker rmi airflow_local_dev_$(version) || true
	rm -R ./logs || true
	rm -R ./metadata_db || true
	find . | grep -E "(/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf
	find . | grep -E "(/logs$)" | xargs rm -rf
