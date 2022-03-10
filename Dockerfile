FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources
ADD will.php /var/www/html/index.php

USER 1001

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm

CMD run-httpd
