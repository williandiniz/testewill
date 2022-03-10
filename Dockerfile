FROM koji/image-build
USER 0
LABEL maintainer="Red Hat, Inc."

LABEL com.redhat.component="ubi8-container" \
      name="ubi8" \
      version="8.5"

#label for EULA
LABEL com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI"

#labels for container catalog
LABEL summary="Provides the latest release of Red Hat Universal Base Image 8."
LABEL description="The Universal Base Image is designed and engineered to be the base layer for all of your containerized applications, middleware and utilities. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly."
LABEL io.k8s.display-name="Red Hat Universal Base Image 8"
LABEL io.openshift.expose-services=""
LABEL io.openshift.tags="base rhel8"

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash"]

RUN rm -rf /var/log/*
#rhbz 1609043
RUN mkdir -p /var/log/rhsm

RUN yum update
RUN yum upgrade -y
RUN yum install apache2 -y
