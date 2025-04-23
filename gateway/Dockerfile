FROM php:8.2-fpm-alpine

# System packages
RUN apk add --no-cache git curl unzip libzip-dev zip bash \
    && docker-php-ext-install zip pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# 🧠 Das ist wichtig: Laravel installieren, wenn nicht vorhanden
RUN test -f artisan || composer create-project laravel/laravel . --no-interaction

COPY . .

RUN php artisan config:clear || true
RUN php artisan route:clear || true
