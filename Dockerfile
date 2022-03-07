FROM php:8.1.1-apache
COPY . /var/www/html
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y libpng-dev zlib1g-dev libzip-dev
RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite
