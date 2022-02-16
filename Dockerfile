FROM ubuntu:latest

ENV TZ=America/Sao_Paulo

RUN  apt-get update

RUN apt-get install -y tzdata

RUN  apt-get -y install \
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
        nano \
        wget

EXPOSE 8080 8443

WORKDIR /var/www/html

RUN echo "Hello from Containerfile" > /var/www/html/teste.html
RUN wget "www.google.com"

CMD apachectl -D FOREGROUND
