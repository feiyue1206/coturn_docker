#!/bin/bash
echo "PORT RANGE: $MIN_PORT-$MAX_PORT"

cd /rrcoturn/coturn-*/bin/

internalIp="$(ip a | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
externalIp="$(dig +short myip.opendns.com @resolver1.opendns.com)"
# our docker is not behind NTA,so use external ip as listening-ip and relay-ip

echo "internal ip is $internalIp"
echo "external ip is $externalIp"

conf="/rrcoturn/turnserver.conf"

cp $CONFIG_NAME $conf

echo "cli-ip=""$internalIp""" >> $conf

turnserver -c $conf




















#
# current configs 
# use default user+password long-time credential
#   user=test:4080218913
#   user=tst2:1234567890
#

echo "listening-port=3478
tls-listening-port=5349
min-port=$MIN_PORT
max-port=$MAX_PORT
verbose
lt-cred-mech
user=test:4080218913
user=tst2:1234567890
realm=rrcoturn
log-file=/rrcoturn/logs/turn.log
cert=/rrcoturn/examples/etc/turn_server_cert.pem
pkey=/rrcoturn/examples/etc/turn_server_pkey.pem
mobility
cli-ip="$internalIp"
cli-password=1qaz@WSX
no-stdout-log"  | tee /rrcoturn/turnserver.conf

#turnadmin -a -u $USERNAME -p $PASSWORD -r $REALM

echo "Start roborock TURN server ..."

turnserver -c /rrcoturn/turnserver.conf 

#userdb=/var/lib/turn/turndb
#external-ip="$externalIp"
#listening-ip="$internalIp"
#relay-ip="$internalIp"
