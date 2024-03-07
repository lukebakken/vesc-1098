# syntax=docker/dockerfile:1
FROM bitnami/openldap:latest
ENV LDAP_ADMIN_USERNAME=admin
ENV LDAP_ADMIN_PASSWORD=admin
WORKDIR /docker-entrypoint-initdb.d
COPY *.ldif .
COPY init.sh .
