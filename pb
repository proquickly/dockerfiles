#!/bin/zsh
docker update --restart=no pyhack && docker stop pyhack && docker rm pyhack
docker build -f /Users/andy/ws/dockerfiles/Dockerfile.pyhack -t pyhack .
docker run --net mbpro -t -d -v /Users/andy/ws:/home/app/ws --restart always --name pyhack pyhack
docker network create --subnet=172.20.0.0/16 mbpro &>/dev/null
docker network connect mbpro pyhack &>/dev/null

# alias python='docker exec pyhack'
# alias putup='docker exec pyhack putup --no-skeleton'