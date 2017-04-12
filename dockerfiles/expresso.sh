#!/bin/bash

if [ -d "../../expresso" ]; then
    git -C ../../expresso pull origin master
else
    mkdir -p ../../expresso
    git -C ../../expresso clone git@github.com:jonnykry/expresso .
fi

cd ../../expresso
npm install
REACT_APP_STRIPE_PUB_KEY="pk_test_K0THZ9ac4Fl3p2irxZnZf4Zw" npm run build
cd ../expresso-config/dockerfiles
cp -R ../../expresso/build ./expresso-build

sudo docker build -f expresso -t ghmeier/expresso .
sudo docker push ghmeier/expresso
