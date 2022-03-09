FROM ubuntu:latest

ENV TZ=America/Sao_Paulo

RUN  apt-get update

RUN apt-get install -y tzdata

RUN apt-get install -y curl \
        nano \
        wget \
        iputils-ping \
        apache2
        
RUN /etc/init.d/apache2 start
        
