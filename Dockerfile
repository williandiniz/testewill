FROM bitnami/nginx
USER 0
RUN install_packages php
### Revert to the original non-root user
USER 1001
