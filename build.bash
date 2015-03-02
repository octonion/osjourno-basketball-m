#! /bin/bash

sudo docker build -t znmeb/osjourno-basketball-m . |& tee build.log
./run.bash
