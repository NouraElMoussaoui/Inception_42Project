all: sh up

sh:
	sh ./srcs/requirements/tools/create_files.sh

up: 
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down 

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v --remove-orphans --rmi all

fclean: clean
	@docker system prune -a
	@docker volume prune
	@sudo rm -rf /home/nel-mous/data
re: clean all

.PHONY: build up down stop clean fclean re
