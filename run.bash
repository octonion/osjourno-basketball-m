#! /bin/bash

sudo docker kill osjourno-basketball-m
sudo docker rm osjourno-basketball-m
sudo docker run --name osjourno-basketball-m -it -p 8787:8787 znmeb/osjourno-basketball-m /bin/bash
