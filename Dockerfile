FROM ubuntu:latest

RUN mkdir n1

RUN apt-get update 

ENV TZ=America/Sao_Paulo
RUN apt-get install -y tzdata

RUN apt install apache2 -y
RUN apt install php -y

COPY /opt/app-root/src /var/www/html/        
        
RUN apt install nano
#RUN apt install vim

EXPOSE 80
USER www-data

#ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

