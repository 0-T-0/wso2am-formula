# WSO2 API Manager saltstack formula

This formula installs wso2 in a clustered environment (each service in it's own
machine).

# Available states

## wso2-am.gateway

Installs the Gateway component

## wso2-am.keymanager

Installs the KeyManager component

## wso2-am.publisher

Installs the API Publisher component

# Pillar configurations

|name                    |default                              |description                                 |
|------------------------|-------------------------------------|--------------------------------------------|
|*wso2am:database:host*  |mariadb                              |database hostname or ip                     |
|*wso2am:ldap:host*      |localhost                            |LDAP hostname or ip                         |
|*wso2am:ldap:port*      |389                                  |LDAP access port                            |
|*wso2am:ldap:root*      |cn=Manager,dc=wso2,dc=org            |LDAP users root                             |
|*wso2am:ldap:password*  |cn=Manager,dc=wso2,dc=org            |LDAP password                               |
|*wso2am:keymanager:host*|keymanager                           |Keymanager componen host                    |
|*wso2am:gateway:host*   |gateway                              |API Gateway component host                  |
|*wso2am:admin_user*     |admin                                |Superadmin name                             |
|*wso2am:admin_password* |admin                                |Superadmin password                         |
|*wso2am:root_dir*       |/opt                                 |Root directory to install wso2              |
|*wso2am:package*        |salt://wso2-am/files/wso2am-1.9.1.zip|Path to the wso2 package to install on hosts|
