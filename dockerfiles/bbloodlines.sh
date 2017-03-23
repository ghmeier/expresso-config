rm bloodlines.o
go build -o bloodlines.o github.com/ghmeier/bloodlines

sudo docker build -f bloodlines -t ghmeier/bloodlines .
sudo docker push ghmeier/bloodlines
