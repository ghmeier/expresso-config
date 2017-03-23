TOKEN=$(cat /dev/urandom | tr -dc '!-~' | fold -w 64 | head -n 1)
echo "JWT=${TOKEN}" > .env
docker-compose pull
docker-compose stop
docker-compose up -d
