# vesc-1098
VESC-1098

## Encode

NOTE: You must encode the double-quotes!

```
rabbitmqctl encode '"grapefruit"' TEST1234

Encrypting value ...
{encrypted,<<"UDGy/S25C1F8uG4PJjzm48TvQhse4GfCHp3XiUs680HlcXMTPMmFLUrXGU7yYxUb">>}
```

## Certs

```
git clone https://github.com/rabbitmq/tls-gen.git
cd tls-gen

# NOTE: certs for OpenLDAP are NOT password-protected
make -C basic CN=ldap-auth-backend

# NOTE: certs for RabbitMQ are password-protected
make -C basic CN=rabbitmq PASSWORD=grapefruit gen-client

# NOTE: we do not need any client certs
rm -vf basic/result/client_*.pem /path/to/vesc-1098/certs

cp -v basic/result/*.pem /path/to/vesc-1098/certs
```

## LDAP queries

```
ldapsearch -x -b 'dc=example,dc=org' -H ldap://localhost:1389 -D 'cn=admin,dc=example,dc=org' -w adminpassword
```

## Users

See "Configuration" here - https://hub.docker.com/r/bitnami/openldap/

* `user01` / `bitnami1`
* `user02` / `bitnami2`
