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

echo "cli-ip=$internalIp" >> $conf
echo "min-port=$MIN_PORT" >> $conf
echo "max-port=$MAX_PORT" >> $conf

echo "\n"
echo "current coturn config is as following:"
echo "\n"
cat $conf

echo "Start roborock TURN server ..."

turnserver -c $conf
 