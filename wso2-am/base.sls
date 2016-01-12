{% import 'wso2-am/settings.sls' as settings %}
unzip:
  pkg.installed: []

unpack-wso2:
  archive.extracted:
    - name: {{ settings.wso2_root_dir }}/
    - source: {{ settings.wso2_file }}
    - archive_format: zip
    - if_missing: {{ settings.wso2_root_dir }}/wso2am-1.9.1
    - user: wso2
    - require:
      - user: wso2
      - pkg: unzip

wso2-user:
  user.present:
    - name: wso2
    - shell: /bin/bash

{%- set conffiles = ['carbon.xml',
                     'registry.xml',
                     'user-mgt.xml'] -%}


{% for file in conffiles %}

{{ file }}:
  file.managed:
    - name: {{ settings.wso2_root_dir }}/wso2am-1.9.1/repository/conf/{{ file }}
    - source: salt://wso2-am/files/{{ file }}.jinja
    - template: jinja
    - user: wso2
    - group: users
    - mode: 0755
    - require:
      - archive: unpack-wso2
      - user: wso2-user

{% endfor %}

master-datasources.xml:
  file.managed:
    - name: {{ settings.wso2_root_dir }}/wso2am-1.9.1/repository/conf/datasources/master-datasources.xml
    - source: salt://wso2-am/files/master-datasources.xml.jinja
    - template: jinja
    - user: wso2
    - group: users
    - mode: 0755
    - require:
      - archive: unpack-wso2
      - user: wso2-user

mysql.jar:
  file.managed:
    - source: salt://wso2-am/files/mysql.jar
    - name: {{ settings.wso2_root_dir }}/wso2am-1.9.1/repository/components/lib/mysql.jar
    - user: wso2
    - group: users
    - mode: 0644
    - require:
      - archive: unpack-wso2
      - user: wso2-user

mysql-connector-java.jar:
 file.managed:
   - source: salt://wso2-am/files/mysql-connector-java.jar
   - name: {{ settings.wso2_root_dir }}/wso2am-1.9.1/repository/components/lib/mysql-connector-java.jar
   - user: wso2
   - group: users
   - mode: 0644
   - require:
     - archive: unpack-wso2
     - user: wso2-user
