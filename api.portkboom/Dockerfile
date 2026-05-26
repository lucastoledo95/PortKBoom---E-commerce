FROM php:8.2-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip git && docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install pdo_mysql gd

RUN chown -R www-data:www-data /var/www/html
