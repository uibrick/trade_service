#!/usr/bin/env bash

cp -f ./run.sh /etc/cron.daily/asset-trade-service.sh

source run.sh dry

function build()
{
    echo "try to build image: <$IMAGE>";
    docker build -t "$IMAGE" "$WD"
    echo "build <$IMAGE> done";
}

if [[ "$1" == "start" ]]; then
build;
start;
elif [[ "$1" == "stop" ]]; then
stop;
elif [[ "$1" == "restart" ]]; then
echo "try to restart ...";
build;
stop;
start;
echo "restarted";
fi
