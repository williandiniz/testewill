FROM php:8.1-apache

#ENV BUILD_ENV=${BUILD_ENV:-dev}

RUN apt update -y &&\
    apt install nano -y &&\
    apt-get install libldb-dev libldap2-dev  -y

#RUN docker-php-ext-install opcache
#RUN apt-get update \
 #   && apt-get install -y git zlib1g-dev libpng-dev \
  #  &&  apt-get install libcurl4-gnutls-dev libxml2-dev -y\
   # && apt-get install libzip-dev -y\
    #&& docker-php-ext-install pdo pdo_mysql zip ldap gd curl soap

RUN apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
#RUN apt-get install -y nodejs
# Set working directory
WORKDIR /var/www/html

RUN apt install git -y
RUN apt python3 git -y
RUN apt vim-common git -y


COPY .apache/. /etc/apache2/

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY . .
#RUN composer install

RUN chmod -R 777 /var/www/html

#RUN php artisan cache:clear
#RUN php artisan config:clear
#RUN php artisan config:cache
#RUN php artisan view:cache

#RUN php artisan l5-swagger:generate

#RUN php artisan migrate
#RUN php artisan db:seed

#RUN cp .env.example .env
#RUN php artisan key:generate
#RUN npm install
#RUN npm run dev
#RUN composer dump-autoload

RUN a2ensite teste
RUN a2enmod rewrite
EXPOSE 8080
USER 1001
RUN service apache2 restart
