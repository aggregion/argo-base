#!/bin/bash

cd $(dirname $0)

mkdir -p install/argo-cd
mkdir -p tmp
rm -rf tmp/argo-cd
cd tmp

git clone https://github.com/argoproj/argo-cd.git --depth=1

cp -fR argo-cd/manifests/base/* ../install/argo-cd

cd ..

rm -rf tmp
