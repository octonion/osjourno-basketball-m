FROM ubuntu:14.10
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# Build-time dependencies for R
RUN apt-get update && apt-get -qqy install \
  apt-file \
  build-essential \
  git \
  postgresql \
  postgresql-contrib \
  r-base-core \
  r-cran-lme4 \
  r-cran-mgcv \
  ruby \
  ruby-dev \
  ruby-mechanize \
  sudo \
  unzip \
  && apt-get clean
RUN apt-file update

# R packages not provided by Ubuntu
ADD install-base.r /root
RUN R --vanilla < /root/install-base.r

# Define administrator account (can 'sudo'!!)
RUN useradd -c 'Open Source Journalist' -G sudo -m osjourno
RUN echo "osjourno:CompJournoStick" | chpasswd

# Clone the source repository
USER osjourno
WORKDIR /home/osjourno
RUN git clone https://github.com/octonion/basketball-m.git

# Open a command line in the repo
WORKDIR /home/osjourno/basketball-m
CMD [ "/bin/bash" ]
