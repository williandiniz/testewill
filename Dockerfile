FROM ubuntu:latest

USER 0

RUN apt-get update 

ENV TZ=America/Sao_Paulo

RUN apt-get install -y tzdata

RUN apt install -y php 
RUN apt install -y php php-gd 
RUN apt install -y curl

RUN mkdir n1

EXPOSE 8080

USER www-data

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

#USER 1001

#RUN ln -s /opt/app-root/src/storage/app/public /opt/app-root/src/public/storage

# Cache laravel
#RUN php artisan cache:clear
#RUN php artisan config:clear
#RUN php artisan config:cache
# RUN php artisan route:clear
# RUN php artisan route:cache
#RUN php artisan view:cache
#RUN php artisan migrate


#FROM ubuntu:latest

#RUN mkdir n1

#RUN apt-get update 

#ENV TZ=America/Sao_Paulo
#RUN apt-get install -y tzdata

#RUN apt install apache2 -y
#RUN apt install php -y

#COPY /opt/app-root/src /var/www/html/        
        
#RUN apt install nano
##RUN apt install vim

#EXPOSE 80
#USER www-data

#ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

