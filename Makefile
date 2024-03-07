.PHONY: clean down up perms rmq-perms verify

PULL ?= always

clean: perms
	docker compose rm --force
	git clean -xffd

down:
	docker compose down
	docker compose rm --force

up: rmq-perms
	docker compose up --build --pull $(PULL)

perms:
	sudo chown -R "$$(id -u):$$(id -g)" $(CURDIR)/rmq
	sudo chown -R "$$(id -u):$$(id -g)" $(CURDIR)/certs
	chmod 0666 $(CURDIR)/certs/*

rmq-perms:
	chmod 0666 $(CURDIR)/certs/*
	sudo chown -R '999:999' $(CURDIR)/rmq
	sudo chown -R '999:999' $(CURDIR)/certs/*rabbitmq*.pem

verify:
	openssl s_client -connect localhost:5771 -CAfile $(CURDIR)/certs/ca_certificate.pem -servername rabbitmq
	openssl s_client -connect localhost:15771 -CAfile $(CURDIR)/certs/ca_certificate.pem -servername rabbitmq
