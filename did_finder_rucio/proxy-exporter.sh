#!/usr/bin/env bash

proxydir=$(dirname ${X509_USER_PROXY})

if [[ ! -d $proxydir ]]
then
    mkdir -p $proxydir
fi

while true; do

    while true; do 
        cp /etc/grid-security-ro/x509up ${X509_USER_PROXY}
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
            echo "INFO $INSTANCE_NAME did-finder none Got proxy."
            chmod 600 ${X509_USER_PROXY}
            break 
        else
            echo "WARNING $INSTANCE_NAME did-finder none An issue encountered when getting proxy."
            sleep 5
        fi
    done

    # Refresh every 10 hours
    sleep 36000

done