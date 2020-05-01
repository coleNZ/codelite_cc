FROM ubuntu:18.04
LABEL maintainer="cole@nztech.ca"

#setup install prereq and install latest codelite
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gnupg software-properties-common sudo git make
RUN apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc \
&& apt-add-repository 'deb https://repos.codelite.org/ubuntu/ bionic universe'
RUN apt-get update && apt-get install -y codelite

#add user can switch to another user, replace nztech with choice of name
RUN groupadd -g 1000 nztech
RUN useradd -d /home/nztech -s /bin/bash -m nztech -u 1000 -g 1000
USER nztech

#set start and launch codelite, again replace nztech with above defined user
ENV HOME /home/nztech
CMD ["/usr/bin/codelite"]
