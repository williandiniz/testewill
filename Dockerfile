FROM ubuntu:latest

ENV TZ=America/Sao_Paulo
    
RUN  apt-get update && \
     apt-get -y install \
        tzdata \
        apache2 \
        libapache2-mod-php \
        libapache2-mod-auth-openidc \
        php-cli \
        php-curl \
        php-mbstring \
        php-gd \
        php-mysql \
        php-json \
        php-ldap \
        php-mime-type \
        php-pgsql \
        php-tidy \
        php-intl \        
        php-xmlrpc \        
        php-soap \
        php-uploadprogress \
        php-zip \
        curl \
        nano

EXPOSE 80

WORKDIR /var/www/html

CMD apachectl -D FOREGROUND
