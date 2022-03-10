FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources
ADD ./index.php /var/www/html/index.php


CMD run-httpd
