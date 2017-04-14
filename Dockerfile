
FROM ubuntu:14.04

RUN	apt-get update && \
	apt-get install -q -y php5-cli php5-curl php5-json php5-mysql php5-snmp php5-readline supervisor

ADD init.sh /init.sh

VOLUME /app
ENTRYPOINT ["/bin/bash", "/init.sh"]

CMD php -r "die( 'no app' );"
