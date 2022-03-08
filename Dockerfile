FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources
ADD app-src/index.html /var/www/html/index.html

# The run script uses standard ways to run the application
CMD run-httpd
