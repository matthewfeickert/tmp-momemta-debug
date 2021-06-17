#!/bin/bash

image_name="neubauergroup/momemta-python-centos"
image_tag="latest"
image="${image_name}:${image_tag}"

docker pull "${image}"

docker run --rm -ti \
	-v "${PWD}":"${PWD}" \
	-w "${PWD}" \
	"${image}"
