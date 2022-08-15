FROM php:7.4-apache

RUN a2enmod rewrite

#ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install \
    curl \
    unzip \
    libmcrypt-dev \
    libmemcached-dev \
    imagemagick \
    zlib1g-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev

#RUN apt search libpng
#RUN apt update && apt install libpng12-dev

# install the PHP extensions we need
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) iconv pdo pdo_mysql mysqli gd

RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt

RUN curl -JLsk \
    'https://github.com/omeka/omeka-s/releases/download/v3.2.2/omeka-s-3.2.2.zip' \
    -o /var/www/omeka-s.zip \
&&  unzip -q /var/www/omeka-s.zip -d /var/www/ \
&&  rm /var/www/omeka-s.zip \
&&  rm -rf /var/www/html \
&&  mv /var/www/omeka-s /var/www/html \
&&  chown -R www-data:www-data /var/www/html

COPY ./database.ini /var/www/html/config/database.ini
COPY ./imagemagick-policy.xml /etc/ImageMagick/policy.xml
COPY ./.htaccess /var/www/html/.htaccess

VOLUME /var/www/html



CMD ["apache2-foreground"]