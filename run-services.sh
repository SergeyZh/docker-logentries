#!/bin/sh

trap "/sbin/service logentries stop; killall tail; exit 0" SIGINT SIGTERM SIGHUP

if [ -z "${ACCOUNT_KEY}" ] ; then
    echo "You need to set ACCOUNT_KEY env variable"
    exit 1
fi


if [ -z "${SERVICE_NAME}" ] ; then
    SERVICE_NAME=`hostname -s`
fi

if [ -z "${HOST_KEY}" ] ; then
    echo "HOST_KEY is not set. Generating new..."
    le register --account-key=${ACCOUNT_KEY} --name=${SERVICE_NAME}
    le whoami
    if [ -z "${LOGS}" ] ; then
	echo "You need to set LOGS env variable"
	exit 1
    fi
    if [ -z "${LOGTYPE}" ] ; then
	le follow ${LOGS}
    else
	le follow --type=${LOGTYPE} ${LOGS}
    fi
    
    echo "Write down your host key. Exiting..."
    exit 1
else
    le --account-key=${ACCOUNT_KEY} --host-key=${HOST_KEY} init
fi


/sbin/service logentries start

touch /var/log/container.log
tail -F /var/log/container.log &

wait
