all:
	sudo mkdir -p /home/zwong/data/wordpress
	sudo mkdir -p /home/zwong/data/mysql
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml down
	@bash -c 'sudo docker rm -f $$(docker ps -aq)'
	docker image prune -f
	docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker compose -f ./srcs/docker-compose.yml down
	@bash -c 'sudo docker rm -f $$(docker ps -aq)'
	docker image prune -f
	sudo rm -rf /home/zwong/data/mysql
	sudo rm -rf /home/zwong/data/wordpress
