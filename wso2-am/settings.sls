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

{%- set wso2_root_dir = salt['pillar.get']('wso2am:root_dir', '/opt') %}

{%- set wso2_file = salt['pillar.get']('wso2am:package', 'salt://wso2-am/files/wso2am-1.9.1.zip') %}
