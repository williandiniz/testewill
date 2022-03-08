FROM httpd:latest

USER 0

ENV TZ=America/Sao_Paulo

RUN  apt-get update

#RUN apt-get install -y tzdata

RUN apt-get install -y tzdata \
        curl \
        nano \
        wget \
        iputils-ping

COPY index.php /usr/local/apache2/htdocs/

COPY ports.conf /usr/local/apache2/conf/ports.conf

RUN ls /usr/local/apache2/htdocs/

EXPOSE 8080

RUN wget "williandiniz.freemyip.com:1005"


