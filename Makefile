
.DEFAULT_GOAL := help
include .env

define HELP

Available commands:

- run: This will call core.

endef

export HELP
help:
	@echo "$$HELP"
.PHONY: help
run: 
	docker compose -p ${COMPOSE_PROJECT_NAME} up -d \
		broker01 broker02 broker03 schema-registry  control-center \

ps:
	docker compose ps

logs:
	docker compose logs

logsf:
	docker compose logs -f

watch:
	watch docker compose ps

down:	
	docker compose down
	cd data; rm -rf confluent.d