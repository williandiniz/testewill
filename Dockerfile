FROM centos:latest
RUN yum -y install httpd
RUN yum clean all
RUN systemctl enable httpd.service
EXPOSE 8080
CMD ["/usr/sbin/init"]
        
