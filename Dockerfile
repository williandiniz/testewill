FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources
RUN sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm
RUN sudo subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
RUN sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E '%{rhel}').rpm
RUN sudo dnf install dnf-utils


ADD index.php /var/www/html/index.php

RUN rm /var/www/html/index.html


# The run script uses standard ways to run the application
CMD run-httpd
