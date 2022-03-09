FROM bitnami/minideb

## Install required system packages and dependencies
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "apache" "aa.bb.cc-dd"
COPY rootfs /


EXPOSE 8080 8443

WORKDIR /app
USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/apache/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/apache/run.sh" ]
