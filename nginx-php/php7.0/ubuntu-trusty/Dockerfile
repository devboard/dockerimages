FROM ubuntu:trusty


ENV LANG C.UTF-8

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
  && echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y ca-certificates nginx gettext-base \
  && rm -rf /var/lib/apt/lists/*
  
RUN ln -sf /usr/share/nginx/html /var/www

RUN apt-key update && \
    apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
      supervisor \
      curl \
      wget \
      mysql-client \
      php7.0-cli \
      php7.0-curl \
      php7.0-fpm \
      php7.0-gd \
      php7.0-intl \
      php7.0-json \
      php7.0-mbstring \
      php7.0-mcrypt \
      php7.0-mysql \
      php7.0-opcache \
      php7.0-xml \
      php-apc \
      php-memcached \
      php-imagick \
      php-zip \
      php-redis 

RUN apt-get install -y git ant 

RUN mkdir -p /run/php/ \
    mkdir -p /var/log/supervisor

COPY configs/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY configs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY configs/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY configs/php-fpm/php-fpm.conf  /etc/php/7.0/fpm/php-fpm.conf
COPY configs/php-fpm/pool.d/www.conf  /etc/php/7.0/fpm/pool.d/www.conf

VOLUME ["/var/www", "/etc/nginx", "/etc/php"]

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
CMD ["/usr/bin/supervisord"]