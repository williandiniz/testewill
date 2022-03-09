FROM registry.access.redhat.com/rhel7

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
RUN yum update 
RUN yum nginx -y
COPY nginx.conf /etc/nginx/nginx.conf

RUN yum install php -y

CMD ["nginx", "-g", "daemon off;"]
