#!/bin/bash

if [ -d "$GOPATH/src/github.com/yuderekyu/covenant" ]; then
    git -C $GOPATH/src/github.com/yuderekyu/covenant pull origin master
else
    mkdir -p $GOPATH/src/github.com/yuderekyu/covenant
    git -C $GOPATH/src/github.com/yuderekyu/covenant clone git@github.com:yuderekyu/covenant .
fi

rm covenant.o
CGO_ENABLED=0 go build -o covenant.o github.com/yuderekyu/covenant

sudo docker build -f covenant -t ghmeier/covenant .
sudo docker push ghmeier/covenant
