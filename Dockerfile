FROM nginx
RUN chmod +x /tmp
COPY nginx.conf /etc/nginx/nginx.conf
RUN yum install libnginx-mod-rtmp -y
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
