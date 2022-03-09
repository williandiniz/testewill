FROM williandiniz/testedocker:2.0

RUN /etc/init.d/apache2 start

RUN apt update -y

RUN apt upgrade -y

RUN apt install curl -y

RUN curl localhost

RUN cat /etc/apache2/ports.conf

