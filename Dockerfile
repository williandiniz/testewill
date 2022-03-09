FROM ubuntu:latest
RUN chmod +x /tmp
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN chown -R www-data:www-data /var/log/nginx
COPY /nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
