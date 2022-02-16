FROM ubuntu:latest

USER 0

# Copy and Work dir
#COPY . /opt/app-root/src
#RUN mv /opt/app-root/src/.env.${AMBIENTE} /opt/app-root/src/.env

RUN apt-get update 

ENV TZ=America/Sao_Paulo

RUN apt-get install -y tzdata

RUN apt install -y php php-gd php-pecl-zip.x86_64 curl

#WORKDIR /opt/app-root/src
#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
 #   php composer-setup.php && \
  #  php -r "unlink('composer-setup.php');" && \
   # mv composer.phar /usr/local/bin/composer

#RUN composer install --no-dev --prefer-dist --optimize-autoloader && \
    composer clear-cache

RUN chown -R 1001:0 /opt/app-root/src
RUN chmod -R 777 /opt/app-root/src

RUN mkdir n1

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

