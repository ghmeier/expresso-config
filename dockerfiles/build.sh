#!/bin/bash
docker build -f bloodlines -t ghmeier/bloodlines .
docker push ghmeier/bloodlines
docker build -f coinage -t ghmeier/coinage .
docker push ghmeier/coinage
docker build -f towncenter -t ghmeier/towncenter .
docker push ghmeier/towncenter
docker build -f covenant -t ghmeier/covenant .
docker push ghmeier/covenant
docker build -f warehouse -t ghmeier/warehouse .
docker push ghmeier/warehouse
docker build -f expresso -t ghmeier/expresso .
docker push ghmeier/expresso