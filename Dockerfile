FROM registry.access.redhat.com/ubi8/nginx-120
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD will.php /tmp/src/
RUN chown -R 1001:0 /tmp/src

RUN yum update 
RUN yum upgrade -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y

RUN yum install php -y
RUN yum install -y
RUN yum install php-cli -y
RUN yum install php-common -y
RUN yum install php-fpm -y

# Let the assemble script to install the dependencies
RUN /usr/libexec/s2i/assemble

# Run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
