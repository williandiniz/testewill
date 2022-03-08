FROM registry.redhat.io/rhscl/httpd-24-rhel7

RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

RUN dnf update

RUN dnf module disable php

RUN dnf module enable php:remi-8.0

RUN dnf install php php-common php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-gd php-mbstring php-xml

# Add application sources
ADD index.php /var/www/html/index.php

# The run script uses standard ways to run the application
CMD run-httpd
