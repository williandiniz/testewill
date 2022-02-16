FROM ubuntu:latest

ENV TZ=America/Sao_Paulo
    
    apt-get update && \
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
        curl 

EXPOSE 80

CMD apachectl -D FOREGROUND 

WORKDIR /var/www/html

RUN rm index.html

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

CMD apachectl -D FOREGROUND
