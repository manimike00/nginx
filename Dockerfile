FROM alpine:3.11.3

RUN apk update && \
	apk add nginx && \
	apk add openrc --no-cache

RUN apk add php7 \
	php7-fpm \
	php7-opcache

RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/html

COPY index.html /var/www/html/index.html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
