acmesky:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build acmesky_backend acmesky_frontend acmesky_mongo camunda_acmesky camunda_workers acmesky_mq acmesky_db acmesky_middleware acmesky_redis

prontogram:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build prontogram_mq prontogram_frontend prontogram_backend

paymentprovider:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build payment_provider_backend payment_provider_frontend payment_provider_redis

flight_companies:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build flight_company_1 flight_company_2 flight_company_3 flight_companies_db

geographical_distances:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build geographical_distances

travel_companies:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build travel_company_1 travel_company_2 travel_company_3

all:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose up --build

clean:
	export COMPOSE_DOCKER_CLI_BUILD=0
	docker-compose rm -f
