#! /bin/bash

set -e

[[ -f dev/docker-compose.yml ]] || (echo "please run this command from the root of the pagure git repo" && exit 1)

mkdir -p lcl/{repos,remotes,attachments,releases}

docker image build -f dev/containers/base -t pagure-base .

docker-compose -f dev/docker-compose.yml build

docker-compose -f dev/docker-compose.yml up

