#!/bin/bash

if [ -d "$GOPATH/src/github.com/ghmeier/bloodlines" ]; then
	git -C $GOPATH/src/github.com/ghmeier/bloodlines pull origin master
else
	mkdir -p $GOPATH/src/github.com/ghmeier/bloodlines
 	git -C $GOPATH/src/github.com/ghmeier/bloodlines clone git@github.com:ghmeier/bloodlines .
fi

if [ -d "$GOPATH/src/github.com/ghmeier/coinage" ]; then
	git -C $GOPATH/src/github.com/ghmeier/coinage pull origin master
else
	mkdir -p $GOPATH/src/github.com/ghmeier/coinage
	git -C $GOPATH/src/github.com/ghmeier/coinage clone git@github.com:ghmeier/coinage
fi

if [ -d "$GOPATH/src/github.com/jakelong95/TownCenter" ]; then
	git -C $GOPATH/src/github.com/jakelong95/TownCenter pull origin master
else
	mkdir -p $GOPATH/src/github.com/jakelong95/TownCenter
	git -C $GOPATH/src/github.com/jakelong95/TownCenter clone git@github.com:jakelong95/TownCenter .
fi

if [ -d "$GOPATH/src/github.com/lcollin/warehouse" ]; then
	git -C $GOPATH/src/github.com/lcollin/warehouse pull origin master
else
	mkdir -p $GOPATH/src/github.com/lcollin/warehouse
	git -C $GOPATH/src/github.com/lcollin/warehouse clone git@github.com:lcollin/warehouse .
fi

if [ -d "$GOPATH/src/github.com/yuderekyu/covenant" ]; then
	git -C $GOPATH/src/github.com/yuderekyu/covenant pull origin master
else
	mkdir -p $GOPATH/src/github.com/yuderekyu/covenant
	git -C $GOPATH/src/github.com/yuderekyu/covenant clone git@github.com:yuderekyu/covenant .
fi

rm bloodlines.o coinage.o towncenter.o warehouse.o covenant.o
go build -o bloodlines.o github.com/ghmeier/bloodlines
go build -o coinage.o github.com/ghmeier/coinage
go build -o towncenter.o github.com/jakelong95/TownCenter
go build -o warehouse.o github.com/lcollin/warehouse
go build -o covenant.o github.com/yuderekyu/covenant

sudo docker build -f bloodlines -t ghmeier/bloodlines .
sudo docker push ghmeier/bloodlines
sudo docker build -f coinage -t ghmeier/coinage .
sudo docker push ghmeier/coinage
sudo docker build -f towncenter -t ghmeier/towncenter .
sudo docker push ghmeier/towncenter
sudo docker build -f covenant -t ghmeier/covenant .
sudo docker push ghmeier/covenant
sudo docker build -f warehouse -t ghmeier/warehouse .
sudo docker push ghmeier/warehouse
sudo docker build -f expresso -t ghmeier/expresso .
sudo docker push ghmeier/expresso