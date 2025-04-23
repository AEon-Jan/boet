FROM php:8.2-fpm-alpine

# Abhängigkeiten
RUN apk add --no-cache git curl unzip libzip-dev zip bash \
    && docker-php-ext-install zip pdo pdo_mysql

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . .

RUN composer install --no-interaction --prefer-dist
