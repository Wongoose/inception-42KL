docker rm -f $(docker ps -aq)
docker image prune -f
docker system prune -a --volumes

rm -rf data/mysql
rm -rf data/wordpress

mkdir data/mysql
mkdir data/wordpress

docker compose up