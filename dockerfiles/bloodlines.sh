#!/bin/bash

if [ -d "$GOPATH/src/github.com/ghmeier/bloodlines" ]; then
    git -C $GOPATH/src/github.com/ghmeier/bloodlines pull origin master
else
    mkdir -p $GOPATH/src/github.com/ghmeier/bloodlines
    git -C $GOPATH/src/github.com/ghmeier/bloodlines clone git@github.com:ghmeier/bloodlines .
fi

rm bloodlines.o
go build -o bloodlines.o github.com/ghmeier/bloodlines

sudo docker build -f bloodlines -t ghmeier/bloodlines .
sudo docker push ghmeier/bloodlines
