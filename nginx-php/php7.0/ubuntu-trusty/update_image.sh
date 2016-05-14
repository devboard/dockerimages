#!/bin/bash
IMAGE_NAME=devboard/nginx-php7-trusty
TAG_NAMES=("1")

cd ${0%/*}

source ../../../build_deploy.sh