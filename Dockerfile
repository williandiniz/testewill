FROM ubuntu:latest
USER root

RUN mkdir n1
RUN mkdir /minha_pasta
RUN echo "hello world" > /minha_pasta/hello.txt

# Install apache and php7
RUN apt-get update 
RUN apt-get upgrade
       
        
        
RUN apt install nano

EXPOSE 80
USER www-data

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

