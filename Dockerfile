FROM ubuntu:latest


RUN mkdir n1
RUN mkdir /minha_pasta
RUN echo "hello world" > /minha_pasta/hello.txt

# Install apache and php7
RUN apt-get update 
RUN apt-get upgrade
#RUN apt install apache2
       
        
        
#RUN apt install nano
#RUN apt install vim

EXPOSE 80
#USER www-data

#ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

