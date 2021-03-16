acmesky:
	docker-compose up --build acmesky_backend acmesky_mongo camunda_acmesky camunda_workers acmesky_mq acmesky_db

prontogram:
	docker-compose up --build prontogram_mq prontogram_frontend prontogram_backend

paymentprovider:
	docker-compose up --build payment_provider_backend payment_provider_frontend payment_provider_redis

flight_companies:
	docker-compose up --build flight_company_1 flight_companies_db

all:
	docker-compose up --build

clean:
	docker-compose rm -f
