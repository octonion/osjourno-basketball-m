#! /bin/bash

sudo docker build -t znmeb/osjourno-mens-bball . |& tee build.log
./run.bash
