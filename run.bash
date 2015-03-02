#! /bin/bash

sudo docker kill osjourno-mens-bball
sudo docker rm osjourno-mens-bball
sudo docker run --name osjourno-mens-bball -it -p 8787:8787 znmeb/osjourno-mens-bball /bin/bash
