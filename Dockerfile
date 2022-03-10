FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources
ADD ./index.php /var/www/html/index.php

RUN yum update -y

RUN yum upgrade -y

RUN yum install curl

# The run script uses standard ways to run the application
CMD run-httpd
