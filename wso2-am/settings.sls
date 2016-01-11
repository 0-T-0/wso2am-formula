{%- set db_host = salt['pillar.get']('wso2am:database:host', 'mariadb') %}
{%- set db_username = 'regadmin' %}
{%- set db_password = 'regadmin' %}
{%- set ldap_host = salt['pillar.get']('wso2am:ldap:host', 'localhost') %}
{%- set ldap_port = salt['pillar.get']('wso2am:ldap:port', '389') %}
{%- set ldap_root = salt['pillar.get']('wso2am:ldap:root', 'cn=Manager,dc=wso2,dc=org') %}
{%- set ldap_password = salt['pillar.get']('wso2am:ldap:password', 'cn=Manager,dc=wso2,dc=org') %}
{%- set keymanager_host = salt['pillar.get']('wso2am:keymanager:host', 'keymanager') %}
{%- set gateway_host = salt['pillar.get']('wso2am:gateway:host', 'gateway') %}

{%- set admin_user = salt['pillar.get']('wso2am:admin_user', 'admin') %}
{%- set admin_password = salt['pillar.get']('wso2am:admin_password', 'admin') %}
