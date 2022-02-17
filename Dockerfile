FROM httpd:latest

ENV TZ=America/Sao_Paulo

RUN  apt-get update

#RUN apt-get install -y tzdata

RUN apt-get install -y tzdata \
        curl \
        nano \
        wget \
        iputils-ping
EXPOSE 8080

RUN wget "williandiniz.freemyip.com:1005"

CMD apachectl -D FOREGROUND
