FROM bitnami/apache
LABEL maintainer "Bitnami <containers@bitnami.com>"

### Change user to perform privileged actions
USER 0
### Install 'vim'
RUN install_packages vim
### Revert to the original non-root user
USER 1001

### Enable mod_ratelimit module
RUN sed -i -r 's/#LoadModule ratelimit_module/LoadModule ratelimit_module/' /opt/bitnami/apache/conf/httpd.conf

### Modify the ports used by Apache by default
## It is also possible to change these environment variables at runtime
#ENV APACHE_HTTP_PORT_NUMBER=8181
#EXPOSE 8181 8443

### Modify the default container user
USER 1002
