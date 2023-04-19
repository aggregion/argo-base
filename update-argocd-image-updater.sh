#!/bin/bash

cd $(dirname $0)

mkdir -p install/argocd-image-updater
mkdir -p tmp
rm -rf tmp/argocd-image-updater
cd tmp

git clone https://github.com/argoproj-labs/argocd-image-updater.git --depth=1

cp -fR argocd-image-updater/manifests/base/* ../install/argocd-image-updater

cd ..

rm -rf tmp
