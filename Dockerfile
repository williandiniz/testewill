FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add application sources to a directory where the assemble script expects them
# and set permissions so that the container runs without the root access
USER 0
RUN yum update
RUN yum install nano -y

RUN yum search php

RUN yum install php8 -y


ADD index.php /tmp/src/index.php
RUN chown -R 1001:0 /tmp/src
USER 1001

# Let the assemble script install the dependencies
RUN /usr/libexec/s2i/assemble

# The run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
