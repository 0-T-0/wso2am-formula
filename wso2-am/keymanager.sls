include:
  - wso2-am/base

keymanager_confs:
  file.recurse:
    - name: /opt/wso2am-1.9.1/repository
    - source: salt://wso2-am/files/keymanager/repository
    - template: jinja
    - user: wso2
    - group: users
    - dir_mode: 0755
    - file_mode: 0755
    - require:
      - archive: unpack-wso2
      - user: wso2-user

/etc/systemd/system/wso2am-keymanager.service:
  file.managed:
    - source: salt://wso2-am/files/systemd/wso2am-keymanager.service
    - template: jinja
    - mode: 755
  service.running:
    - name: wso2am-keymanager
    - enable: True
    - require:
      - file: /etc/systemd/system/wso2am-keymanager.service
