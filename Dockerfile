FROM ubuntu:latest

ENV TZ=America/Sao_Paulo

RUN  apt-get update

RUN apt-get install -y tzdata

RUN  apt-get -y install \
        apache2 \
        wget \
        nano
        
EXPOSE 8080 8443

RUN sed -i -e 's/80/8080/g' -e 's/443/8443/g' /etc/apache2/ports.conf 

WORKDIR /var/www/html

RUN echo "Hello from Containerfile" > /var/www/html/teste.html
RUN wget "www.google.com"

#CMD apachectl -D FOREGROUND
