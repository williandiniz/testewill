FROM nginx:latest

RUN apt-get update -y \
    && apt-get install -y nginx
