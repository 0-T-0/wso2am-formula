{% import 'wso2-am/settings.sls' as settings %}
include:
  - wso2-am/base

gateway_confs:
  file.recurse:
    - name: {{ settings.wso2_root_dir }}/wso2am-1.9.1/repository
    - source: salt://wso2-am/files/gateway/repository
    - template: jinja
    - user: wso2
    - group: users
    - dir_mode: 0755
    - file_mode: 0755
    - require:
      - archive: unpack-wso2
      - user: wso2-user

/etc/systemd/system/wso2am-gateway.service:
  file.managed:
    - source: salt://wso2-am/files/systemd/wso2am-gateway.service
    - template: jinja
    - mode: 755
  service.running:
    - name: wso2am-gateway
    - enable: True
    - restart: True
    - require:
      - file: /etc/systemd/system/wso2am-gateway.service
    - watch:
      - file: {{ settings.wso2_root_dir }}/wso2am-1.9.1/*
