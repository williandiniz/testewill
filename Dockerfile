FROM nginx
RUN chmod +x /tmp
COPY nginx.conf /etc/nginx/nginx.conf
RUN apt-get install libnginx-mod-rtmp
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
