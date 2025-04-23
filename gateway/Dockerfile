# 📄 /gateway/Dockerfile

FROM php:8.2-fpm-alpine

# System-Pakete
RUN apk add --no-cache git curl unzip libzip-dev zip bash \
    && docker-php-ext-install zip pdo pdo_mysql

# Composer reinziehen
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Projektverzeichnis
WORKDIR /var/www/html

# Laravel installieren (wenn nicht vorhanden)
RUN test -f artisan || composer create-project laravel/laravel . --no-interaction

# Kopiere ggf. angepasste Dateien rein (später für routes/api.php, .env.example usw.)
COPY . .

# Production-sicher:
RUN php artisan config:clear && php artisan route:clear
