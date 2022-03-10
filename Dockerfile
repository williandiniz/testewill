FROM registry.access.redhat.com/ubi8/nginx-120@sha256:6d7bd12b990d7796082db0282ffb029149961b21a9044242612c66b3e6d72149
USER root
RUN whoami
RUN yum update
RUN yum upgrade -y
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm 
RUN dnf module enable php:remi-8.0 -y  
RUN dnf install php php-cli php-common -y

USER root
#USER 1001

# Let the assemble script to install the dependencies

