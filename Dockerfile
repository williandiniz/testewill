FROM registry.redhat.io/rhel8/httpd-24

USER 0

RUN yum install php

# Add application sources
ADD /index.php /var/www/html/index.php

# Run script uses standard ways to run the application
CMD run-httpd
