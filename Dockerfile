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

COPY ./public-html/ /usr/local/apache2/htdocs/

COPY ports.conf /usr/local/apache2/htdocs/

RUN ls /usr/local/apache2/htdocs/

RUN wget "williandiniz.freemyip.com:1005"

EXPOSE 80
USER www-data

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
