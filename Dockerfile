FROM nginx
RUN mkdir /tmp
RUN chmod +x /tmp
COPY nginx.conf /etc/nginx/nginx.conf

