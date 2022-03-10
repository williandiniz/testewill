#FROM registry.access.redhat.com/ubi8/ubi@sha256:0e34c8c9f6a6c4fa66c076f4664025b4f34c002c842ff5c0f4bbe26933610c40
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
COPY will.php /tmp/src/

COPY will.php /usr/share/httpd/noindex/
COPY will.php /usr/share/nginx/html/
COPY will.php /usr/share/testpage/

RUN chown -R 1001:0 /tmp/src
#USER 1001

# Let the assemble script to install the dependencies
RUN /usr/libexec/s2i/assemble

# Run script uses standard ways to run the application
CMD /usr/libexec/s2i/run

RUN whoami

