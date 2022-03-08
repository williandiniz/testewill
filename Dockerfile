FROM registry.redhat.io/rhscl/httpd-24-rhel7

RUN dnf install php php-cli php-common

RUN php -v

# Add application sources
ADD index.php /var/www/html/index.php

# The run script uses standard ways to run the application
CMD run-httpd
