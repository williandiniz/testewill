FROM ubuntu:latest
USER root

RUN mkdir n1
RUN mkdir /minha_pasta
RUN echo "hello world" > /minha_pasta/hello.txt

# Install apache and php7
RUN apt-get update && \
    apt-get -y install \
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
RUN apt install nano

EXPOSE 80
USER www-data

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]

