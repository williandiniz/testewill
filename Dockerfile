FROM registry.access.redhat.com/ubi8/ubi@sha256:0e34c8c9f6a6c4fa66c076f4664025b4f34c002c842ff5c0f4bbe26933610c40
USER root
RUN yum update
RUN yum upgrade -y
RUN yum install httpd -y
COPY httpd.conf etc/httpd/conf/httpd.conf
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm 
RUN dnf module enable php:remi-8.0 -y  
RUN dnf install php php-cli php-common -y
EXPOSE 8080
# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
