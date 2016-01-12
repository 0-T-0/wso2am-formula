#!/usr/bin/env sh

################################################################################
# Load schemas and configure LDAP database
# ----------------------------------------
# 
# The execution order of the ldif files is important, because they depend on
# the one before; and, if one fails, it leaves the DB in a broken stateA.
################################################################################

# Exit on first command that fails
set -e 

ldapadd -H ldapi:/// -Y EXTERNAL -f /etc/openldap/schema/cosine.ldif
ldapadd -H ldapi:/// -Y EXTERNAL -f /etc/openldap/schema/nis.ldif
ldapadd -H ldapi:/// -Y EXTERNAL -f /etc/openldap/schema/inetorgperson.ldif

ldapadd -H ldapi:/// -Y EXTERNAL -f /tmp/ldap/ldif/wso2Person.ldif
ldapadd -H ldapi:/// -Y EXTERNAL -f /tmp/ldap/ldif/scimPerson.ldif
ldapadd -H ldapi:/// -Y EXTERNAL -f /tmp/ldap/ldif/identityPerson.ldif

ldapmodify -Y EXTERNAL -H ldapi:/// -f /tmp/ldap/configure.ldif
ldapadd -x -D cn=Manager,dc=wso2,dc=org -wadmin -f /tmp/ldap/basedomain.ldif
