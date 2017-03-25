#!/bin/bash

if [ -d "$GOPATH/src/github.com/jakelong95/TownCenter" ]; then
    git -C $GOPATH/src/github.com/jakelong95/TownCenter pull origin master
else
    mkdir -p $GOPATH/src/github.com/jakelong95/TownCenter
    git -C $GOPATH/src/github.com/jakelong95/TownCenter clone git@github.com:jakelong95/TownCenter .
fi

rm towncenter.o
CGO_ENABLED=0 go build -o towncenter.o github.com/jakelong95/TownCenter

sudo docker build -f towncenter -t ghmeier/towncenter .
sudo docker push ghmeier/towncenter
