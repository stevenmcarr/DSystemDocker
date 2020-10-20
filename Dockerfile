FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install gcc
RUN apt-get -y install g++
RUN apt-get -y install make
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install python3
RUN apt-get -y install flex
RUN useradd -ms /bin/bash dsystem
USER dsystem
COPY --chown=dsystem loop.bash /home/dsystem
ENV DSYSTEM /home/dsystem/DSystem
ENV DSYSTEM_OS Linux-i686
ENV PATH ${PATH}:${DSYSTEM}/src/execs/Memoria
WORKDIR /home/dsystem
RUN git clone https://github.com/stevenmcarr/DSystem.git
RUN make --directory=${DSYSTEM}/src
WORKDIR /home/dsystem
CMD /bin/bash loop.bash
