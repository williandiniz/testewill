FROM registry.access.redhat.com/ubi8/ubi:8.1

RUN yum update -y 
RUN yum upgrade -y
RUN dnf install git -y

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm 
RUN dnf module enable php:remi-8.0 -y  
RUN dnf install php php-cli php-common -y
RUN dnf install php-mysqlnd -y
RUN dnf install php-pecl-zip -y
RUN dnf install openldap-clients -y
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN dnf install php-soap -y

#RUN dnf install libldb -y
#RUN dnf install libldb-devel -y

#RUN dnf install libpng-dev -y
#RUN dnf install libcurl4-gnutls-dev -y
#RUN dnf install libxml2-dev -y
#RUN dnf install libzip-dev -y
#RUN dnf install zip -y
#RUN dnf install ldap -y
#RUN dnf install gd -y
#RUN dnf install curl -y
#RUN dnf install soap -y


ADD index.php /var/www/html
ADD info.php /var/www/html

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
  && sed -i 's/listen.acl_users = apache,nginx/listen.acl_users =/' /etc/php-fpm.d/www.conf \
  && mkdir /run/php-fpm \
  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm

#WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN git clone https://github.com/laravel/laravel.git
RUN cp -R laravel /var/www/html
# Set working directory
WORKDIR /var/www/html/laravel

#COPY . .

#RUN composer config --auth gitlab-token.git.sebraemg.com.br "ct9ZiYyPsTjiee4Y7XhK" --no-ansi --no-interaction
#RUN composer install --ignore-platform-req=ext-ldap
#RUN cd /var/www/html/laravel
RUN pwd

RUN composer install
#WillRUN USER 1000
RUN chmod -R 777 /var/www/html



EXPOSE 8080
USER 1001
CMD php-fpm & httpd -D FOREGROUND
