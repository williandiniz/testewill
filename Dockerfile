FROM bitnami/nginx
LABEL maintainer "Bitnami <containers@bitnami.com>"

### Change user to perform privileged actions
USER 0
### Install 'vim'
RUN install_packages php
### Revert to the original non-root user
USER 1001

### Modify 'worker_connections' on NGINX config file to '512'
RUN sed -i -r "s#(\s+worker_connections\s+)[0-9]+;#\1512;#" /opt/bitnami/nginx/conf/nginx.conf

### Modify the ports used by NGINX by default
ENV NGINX_HTTP_PORT_NUMBER=8181 # It is also possible to change this environment variable at runtime
EXPOSE 8181 8143

### Modify the default container user
USER 1002
