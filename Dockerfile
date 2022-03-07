FROM php:8.1.3-apache

# Install system dependencies
RUN apt-get update && apt-get install -y git

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

RUN apt update -y &&\
    apt install nano -y &&\
    apt-get install libldb-dev libldap2-dev wget net-tools -y
    
RUN docker-php-ext-install opcache

RUN apt-get update \
    && apt-get install -y git zlib1g-dev libpng-dev \
    &&  apt-get install libcurl4-gnutls-dev libxml2-dev -y\
    && apt-get install libzip-dev -y\
    && docker-php-ext-install pdo pdo_mysql zip ldap gd curl soap

COPY . .

EXPOSE 9000
