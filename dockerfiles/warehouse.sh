#!/bin/bash

if [ -d "$GOPATH/src/github.com/lcollin/warehouse" ]; then
    git -C $GOPATH/src/github.com/lcollin/warehouse pull origin master
else
    mkdir -p $GOPATH/src/github.com/lcollin/warehouse
    git -C $GOPATH/src/github.com/lcollin/warehouse clone git@github.com:lcollin/warehouse .
fi

rm warehouse.o
go build -o warehouse.o github.com/lcollin/warehouse

sudo docker build -f warehouse -t ghmeier/warehouse .
sudo docker push ghmeier/warehouse
