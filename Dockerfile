FROM php:8.2-fpm

ARG user
ARG uid

# Install system dependencies
RUN apt update && apt install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    unzip \ 
    zlib1g-dev
# Clear cache
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip  # Add 'zip'

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create a non-root user
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www

USER $user
