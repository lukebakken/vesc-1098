#!/bin/sh
# vim:sw=4:et:
# shellcheck disable=SC2086

set -eux

tmp_script_dir="$(cd "$(dirname "$0")" && pwd)"
readonly script_dir="$tmp_script_dir"
unset tmp_script_dir

readonly uri="ldap://localhost:8000"
readonly binddn='cn=config'
readonly passwd='admin'
readonly auth="-x -D $binddn -w $passwd"

# shellcheck disable=SC2034
for seconds in 1 2 3 4 5 6 7 8 9 10; do
    ldapsearch $auth -H "$uri" -LLL -b 'cn=config' dn && break;
    sleep 1
done

ldapadd $auth -H "$uri" "$script_dir/global.ldif"

ldapadd $auth -H "$uri" "$script_dir/memberof_init.ldif"
ldapmodify $auth -H "$uri" -f "$script_dir/refint_1.ldif"
ldapadd $auth -H "$uri" -f "$script_dir/refint_2.ldif"
ldapsearch $auth -H "$uri" -LLL -b cn=config dn
