eval $(docker-machine env)
docker run -d -p 3306:3306 -e STARTUP_SQL="/scripts/create_tables.sql" -e MYSQL_PASS="bloodlines" ghmeier/expresso-mysql:latest
