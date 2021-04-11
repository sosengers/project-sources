acmesky:
	docker-compose up --build acmesky_backend acmesky_mongo camunda_acmesky camunda_workers acmesky_mq acmesky_db acmesky_middleware acmesky_redis

prontogram:
	docker-compose up --build prontogram_mq prontogram_frontend prontogram_backend

paymentprovider:
	docker-compose up --build payment_provider_backend payment_provider_frontend payment_provider_redis

flight_companies:
	docker-compose up --build flight_company_1 flight_company_2 flight_company_3 flight_companies_db

geographical_distances:
	docker-compose up --build geographical_distances

travel_companies:
	docker-compose up --build travel_company_1 travel_company_2 travel_company_3

all:
	docker-compose up --build

clean:
	docker-compose rm -f
