sudo docker rm -f $(sudo docker ps -aq)
sudo docker image prune -f
#sudo docker system prune -a --volumes

sudo rm -rf /home/zwong/data/mysql
sudo rm -rf /home/zwong/data/wordpress

mkdir /home/zwong/data/mysql
mkdir /home/zwong/data/wordpress

