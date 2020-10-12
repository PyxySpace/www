FROM php:7.4-fpm

RUN apt-get update && apt-get install -y libicu-dev && docker-php-ext-install intl opcache

RUN docker-php-ext-install pdo_mysql bcmath iconv
RUN apt-get update -y
RUN apt-get upgrade -y

RUN echo 'date.timezone = "Europe/Paris"' > /usr/local/etc/php/conf.d/tzone.ini
USER www-data