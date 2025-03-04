#######################
# Build backend source
#######################
FROM composer:2.8.6 as backend
WORKDIR /app

# Copy composer.lock and composer.json
COPY composer.json composer.lock /app/

# Composer install
RUN composer install  \
    --ignore-platform-reqs \
    --no-ansi \
    --no-autoloader \
    --no-dev \
    --no-interaction \
    --no-scripts

COPY . /app/
RUN composer dump-autoload --optimize --classmap-authoritative

#####################
# Build the frontend
#####################
FROM node as frontend

RUN mkdir -p /app/public

COPY package.json package-lock.json vite.config.js /app/
WORKDIR /app

RUN npm install
# RUN npm run build

####################
# Build the image
####################
FROM php:8-fpm-buster

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    openssl \
    zip \
    unzip \
    git \
    default-mysql-client \
    iputils-ping \
    libonig-dev \
    libicu-dev \
    libwebp-dev \
    libzip-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Setup PHP extensions
RUN docker-php-ext-configure gd \
    --with-jpeg \
    --with-freetype
RUN docker-php-ext-configure intl

# Install extensions
RUN docker-php-ext-install mbstring pdo pdo_mysql gd pcntl zip intl

COPY --from=backend /app /var/www
COPY --from=frontend /app/node_modules /var/www/node_modules

# Copy existing application directory permissions
# COPY --chown=1001:1001 . /var/www

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Change current user
USER $user

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]