openldap:
  pkg.installed:
    - pkgs:
        - openldap
        - openldap-servers
        - openldap-clients

slapd:
  service.running:
    - name: slapd
    - enable: True
    - require:
      - pkg: openldap

schemas:
  file.recurse:
    - name: /tmp/ldap
    - source: salt://ldap

/tmp/ldap/loadschemas.sh:
  cmd.script:
    - creates: "/etc/openldap/slapd.d/cn=config/cn=schema/cn={7}scimperson.ldif"
    - require:
      - service: slapd
      - file: schemas
