FROM registry.redhat.io/rhel8/httpd-24

# Add application sources to a directory where the assemble script expects them
# and set permissions so that the container runs without the root access
USER 0
ADD will.php /tmp/src/index.html
RUN chown -R 1001:0 /tmp/src

RUN yum update 
RUN yum upgrade
RUN yum install php


# Let the assemble script install the dependencies
RUN /usr/libexec/s2i/assemble

# The run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
