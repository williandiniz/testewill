FROM php:8.0.0rc1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

RUN apt update -y &&\
    apt install nano -y &&\
    apt-get install libldb-dev libldap2-dev  -y
    
RUN docker-php-ext-install opcache

RUN apt-get update \
    && apt-get install -y git zlib1g-dev libpng-dev \
    &&  apt-get install libcurl4-gnutls-dev libxml2-dev -y\
    && apt-get install libzip-dev -y\
    && docker-php-ext-install pdo pdo_mysql zip ldap gd curl soap wget net-tools



# Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
  
# Set working directory
WORKDIR /var/www/html

COPY . .

#RUN composer config --auth gitlab-token.git.sebraemg.com.br "ct9ZiYyPsTjiee4Y7XhK" --no-ansi --no-interaction
#RUN composer install

USER 0

EXPOSE 9000

CMD ["php-fpm"]
