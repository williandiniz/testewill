FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources
ADD index.php /var/www/html/

# The run script uses standard ways to run the application
CMD run-httpd
