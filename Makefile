.PHONY: clean down up perms rmq-perms

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
	chmod 0666 $(CURDIR)/certs/*

rmq-perms:
	sudo chown -R '999:999' $(CURDIR)/rmq
	sudo chown -R '999:999' $(CURDIR)/certs/*rabbitmq*.pem
	chmod 0666 $(CURDIR)/certs/*
