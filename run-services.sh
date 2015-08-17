#!/bin/sh

trap "/sbin/service logentries stop; killall tail; exit 0" SIGINT SIGTERM SIGHUP

if [ -z "${ACCOUNT_KEY}" ] ; then
    echo "You need to set ACCOUNT_KEY env variable"
    exit 1
fi

if [ -z "${LOGS}" ] ; then
    echo "You need to set LOGS env variable"
    exit 1
fi


if [ -z "${LOGSET}" ] ; then
    LOGSET="DemoSet"
fi


le register --account-key=${ACCOUNT_KEY}

if [ -z "${LOGTYPE}" ] ; then
    le follow --name=${LOGSET} ${LOGS}
else
    le follow --name=${LOGSET} --type=${LOGTYPE} ${LOGS}
fi

/sbin/service logentries start

touch /var/log/container.log
tail -F /var/log/container.log &

wait
