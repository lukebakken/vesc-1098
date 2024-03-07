# vesc-1098
VESC-1098

## Certs

```
git clone https://github.com/rabbitmq/tls-gen.git
cd tls-gen/basic

# NOTE: certs for RabbitMQ are password-protected
make CN=rabbitmq PASSWORD=grapefruit

# NOTE: certs for OpenLDAP are NOT password-protected
make CN=ldap-auth-backend gen-client

cp -v result/*.pem /path/to/vesc-1098/certs
```

## LDAP queries

```
ldapsearch -x -b 'dc=example,dc=org' -H ldap://localhost:1389 -D 'cn=admin,dc=example,dc=org' -w adminpassword
```

## Users

See "Configuration" here - https://hub.docker.com/r/bitnami/openldap/

* `admin` / `adminpassword`
* `user01` / `bitnami1`
* `user02` / `bitnami2`
