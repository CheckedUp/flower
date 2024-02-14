#!/bin/bash
set -e

N=${1:-10}

for i in $(seq 1 $N); do
    celery call -A tasks tasks.add --args="[$i,$i]";
done

celery -A tasks call tasks.sleep --args='[10]'
celery -A tasks call tasks.error --args='[10]'
