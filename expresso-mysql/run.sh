eval $(docker-machine env)
docker run -d -p 3306:3306 -e STARTUP_SQL="/scripts/create_tables.sql" ghmeier/expresso-mysql:latest
