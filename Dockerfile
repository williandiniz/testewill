FROM registry.access.redhat.com/ubi8/nginx-120
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD will.php /tmp/src/
RUN chown -R 1001:0 /tmp/src

RUN yum update 
RUN yum upgrade -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y --enablerepo=remi-php80 php php-cli


# Let the assemble script to install the dependencies
RUN /usr/libexec/s2i/assemble

# Run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
