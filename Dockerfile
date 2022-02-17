FROM httpd:latest

ENV TZ=America/Sao_Paulo

RUN  apt-get update

#RUN apt-get install -y tzdata

RUN apt-get install -y tzdata
        curl \
        nano \
        wget \
        iputils-ping
EXPOSE 8080

RUN echo "Hello from Containerfile" > /var/www/html/teste.html
RUN wget "www.google.com"
RUN ping "williandiniz.freemyip.com:1005"


CMD apachectl -D FOREGROUND
