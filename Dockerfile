FROM nginx
RUN chmod +x /tmp
COPY nginx.conf /etc/nginx/nginx.conf

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
