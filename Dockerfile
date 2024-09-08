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
    zlib1g-dev \
    libzip-dev \
    vim \
    net-tools \
    gnupg \
    software-properties-common

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install -y nodejs

# Clear cache
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip 

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create a non-root user
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www

# Set permissions for /var/www
RUN chown -R $user:$user /var/www

USER $user

# Copy application files and install npm dependencies
COPY --chown=$user:$user . /var/www
RUN npm install && npm run build

EXPOSE 9000
