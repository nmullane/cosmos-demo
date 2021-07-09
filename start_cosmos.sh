#!/bin/bash
# Allow connections to xserver
xhost +
docker run -ti --net=host --rm -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix:ro --mount type=bind,source=/home/niall/Code/GSFC/cosmos-demo,target=/cosmos ballaerospace/cosmos
