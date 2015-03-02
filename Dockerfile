FROM ubuntu:14.10
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# Build-time dependencies for R
RUN apt-get update && apt-get -qqy install \
  apt-file \
  build-essential \
  git \
  libpq-dev \
  postgresql \
  postgresql-contrib \
  postgresql-plperl \
  r-base-core \
  r-cran-lme4 \
  r-cran-mgcv \
  rpl \
  ruby \
  ruby-dev \
  ruby-mechanize \
  sudo \
  unzip \
  && apt-get clean
RUN apt-file update

# R packages not provided by Ubuntu
ADD install-base.r /root/
RUN R --vanilla < /root/install-base.r

# Define administrator account (can 'sudo'!!)
RUN useradd -c 'Open Source Journalist' -G sudo -m osjourno
RUN echo "osjourno:CompJournoStick" | chpasswd
ADD sudo-start-postgresql.bash /home/osjourno/
RUN chown -R osjourno:osjourno /home/osjourno

# Initialize PostgreSQL
RUN service postgresql start \
  && sudo -u postgres createuser --superuser osjourno \
  && sudo -u postgres createdb --owner=osjourno osjourno \
  && sudo -u postgres createdb --owner=osjourno basketball-m

# Clone the source repository
USER osjourno
WORKDIR /home/osjourno
RUN git clone https://github.com/octonion/basketball-m.git

# Open a command line in the repo
WORKDIR /home/osjourno/basketball-m
CMD [ "/bin/bash" ]
