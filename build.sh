#!/bin/bash
export OUTER_UID=$UID
#docker build --no-cache --compress -t jonathonf/manjaro-src .
docker build --compress -t jonathonf/manjaro-src .
