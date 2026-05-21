FROM php:8.2-fpm

RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip && docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install gd

RUN chown -R www-data:www-data /var/www/html
