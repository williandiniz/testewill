FROM nginx
RUN chmod +x /tmp
COPY nginx.conf /etc/nginx/nginx.conf

