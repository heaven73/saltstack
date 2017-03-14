#
# Install and configure filebeat log shipper
#

filebeat-install:
  pkg.present:
    - name: filebeat

filebeat-service:
  service.running:
    - name: filebeat

/etc/filebeat/filebeat.yml:
  file.managed:
    - source: salt://elk/files/etc/filebeat/filebeat.yml
    - template: jinja
    - watch_in:
      - service: filebeat-service
