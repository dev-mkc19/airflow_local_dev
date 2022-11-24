# airflow version to operate with
version = 
version = $(version)

# Open Docker Application
prepare:
	open -a "Docker"
	sleep 20

# Build image
compile: prepare
	docker build -t airflow_local_dev_$(version) ./airflow_$(version)

# Start containers from build image
start: compile
	docker compose -f "docker-compose.airflow_$(version).yml" up -d --build 

# Stop containers and close the app
stop:
	docker compose -f "docker-compose.airflow_$(version).yml" down
	osascript -e 'quit app "Docker Desktop"'

# Remove all compiled staff
clean:
# || true is used for suppress errors if occured
	docker rmi airflow_local_dev_$(version) || true
	rm -R ./logs || true
	rm -R ./metadata_db || true
	find . | grep -E "(/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf
	find . | grep -E "(/logs$)" | xargs rm -rf