#!/usr/bin/env bash

IMAGE="asset-trade-service"
WD="/home/rdc/asset-trade"

function start()
{
    echo "start ...";
    docker run -d -e PRODUCTION=1 -e TZ="Asia/Shanghai" --rm --name "$IMAGE" -v "$WD":/usr/src/app \
        -w /usr/src/app -p 5000:5000 asset-trade-service python app.py;
    echo "started";
}

function stop()
{
    echo "stop ...";
    docker stop "$IMAGE";
    echo "stop finished";
}

if [[ "$1" == "dry" ]]; then
echo "$1"
exit 0
else
start;
fi
