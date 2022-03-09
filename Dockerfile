FROM ubuntu:latest
RUN chmod +x /tmp
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y tzdata
ENV TZ=America/Sao_Paulo

RUN apt-get install apache2 -y
COPY /ports.conf /etc/apache2/ports.conf

