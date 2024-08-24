#!/bin/bash

DOCKER_PHP = dsb0-php
UID = $(shell id -u) ## User UID
SYMFONY_VERSION = 6.4.*
# Ruta que deseas añadir al PATH
NEW_PATH=/.symfony5/bin


help: ## Show this help message
	@echo ${UID}
	@echo 'usage: make [target]'
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

build: ## Build containers
	U_ID=${UID} docker compose build

start: ## Start the containers
	docker network create dsb0-network || true
	U_ID=${UID} docker compose up -d

stop: ## Stop the containers
	U_ID=${UID} docker compose down

ssh: ## ssh's into the php container
	U_ID=${UID} docker exec -it --user ${UID} ${DOCKER_PHP} bash

php-logs: ## Tails the Symfony dev log
	U_ID=${UID} docker exec -it --user ${UID} ${DOCKER_PHP} tail -f var/log/dev.log

symfony-setup: ## Install symfony cli, composer and symfony skeleton
	U_ID=${UID} docker exec --user ${UID} -it ${DOCKER_PHP} /bin/bash -c  "\
        rm -Rf ./public && \
	    curl -sS https://get.symfony.com/cli/installer | bash && \
        echo '{}' > composer.json && \
        composer install --no-scripts --no-interaction --optimize-autoloader" && \
        composer create-project symfony/skeleton:"${SYMFONY_VERSION}" && \
        cp -r skeleton/. ./ && \
        rm -Rf skeleton/ && \
	    bin/console cache:clear && \
        chmod -R 777 ./var


