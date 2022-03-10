FROM registry.access.redhat.com/ubi8/ubi@sha256:0e34c8c9f6a6c4fa66c076f4664025b4f34c002c842ff5c0f4bbe26933610c40
USER 0
RUN yum update
RUN yum upgrade -y
RUN yum install httpd -y
