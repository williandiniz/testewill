FROM bitnami/minideb
...
RUN install_packages php
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack 
...
COPY rootfs /
RUN /opt/bitnami/scripts/nginx/postunpack.sh
...
ENV BITNAMI_APP_NAME="nginx"
EXPOSE 8080 8443
WORKDIR /app
USER 1001
...
ENTRYPOINT [ "/opt/bitnami/scripts/nginx/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/nginx/run.sh" ]
