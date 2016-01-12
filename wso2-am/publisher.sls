{% import 'wso2-am/settings.sls' as settings %}
include:
  - wso2-am/base

gateway_confs:
  file.managed:
    - name: {{ settings.wso2_root_dir }}/wso2am-1.9.1/repository/conf/api-manager.xml
    - source: salt://wso2-am/files/publisher/api-manager.xml
    - template: jinja
    - user: wso2
    - group: users
    - dir_mode: 0755
    - file_mode: 0755
    - require:
      - archive: unpack-wso2
      - user: wso2-user

/etc/systemd/system/wso2am-publisher.service:
  file.managed:
    - source: salt://wso2-am/files/systemd/wso2am-publisher.service
    - template: jinja
    - mode: 755
  service.running:
    - name: wso2am-publisher
    - enable: True
    - restart: True
    - require:
      - file: /etc/systemd/system/wso2am-publisher.service
    - watch:
      - file: {{ settings.wso2_root_dir }}/wso2am-1.9.1/*
