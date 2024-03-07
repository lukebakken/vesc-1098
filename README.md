# vesc-1098
VESC-1098

## LDAP queries

```
ldapsearch -x -b 'dc=example,dc=org' -H ldap://localhost:1389 -D 'cn=admin,dc=example,dc=org' -w adminpassword
```

## Users

See "Configuration" here - https://hub.docker.com/r/bitnami/openldap/

* `admin` / `adminpassword`
* `user01` / `bitnami1`
* `user02` / `bitnami2`
