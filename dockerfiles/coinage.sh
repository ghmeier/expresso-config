#!/bin/bash

if [ -d "$GOPATH/src/github.com/ghmeier/coinage" ]; then
    git -C $GOPATH/src/github.com/ghmeier/coinage pull origin master
else
    mkdir -p $GOPATH/src/github.com/ghmeier/coinage
    git -C $GOPATH/src/github.com/ghmeier/coinage clone git@github.com:ghmeier/coinage
fi

rm coinage.o
CGO_ENABLED=0 go build -o coinage.o github.com/ghmeier/coinage

sudo docker build -f coinage -t ghmeier/coinage .
sudo docker push ghmeier/coinage
