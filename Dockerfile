FROM williandiniz/testedocker:2.0

RUN apt update -y

RUN apt upgrade -y

RUN apt install curl -y

COPY ./ports.conf /etc/apache2/ports.conf

RUN /etc/init.d/apache2 start

RUN cat /etc/apache2/ports.conf


