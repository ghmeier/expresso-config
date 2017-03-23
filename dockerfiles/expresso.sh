#!/bin/bash

if [ -d "../../expresso" ]; then
    git -C ../../expresso pull origin master
else
    mkdir -p ../../expresso
    git -C ../../expresso clone git@github.com:jonnykry/expresso .
fi

cd ../../expresso
npm install
npm run build
cd ../expresso-config/dockerfiles
cp -R ../../expresso/build ./expresso-build

sudo docker build -f expresso -t ghmeier/expresso .
sudo docker push ghmeier/expresso
