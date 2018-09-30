#!/usr/bin/env bash

cp -f ./run.sh /etc/cron.daily/asset-trade-service.sh

#source run.sh

IMAGE="asset-trade-service"
WD="$PWD"

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
else:
start;
fi
