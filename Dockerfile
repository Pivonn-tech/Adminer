# Use the official PHP image with Apache
FROM php:8.0-apache

# Install the necessary dependencies for PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the ServerName to suppress warnings
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy the Adminer PHP file to the appropriate directory
COPY adminer.php /var/www/html/adminer.php

# Set permissions for the adminer.php file
RUN chmod 644 /var/www/html/adminer.php

# Expose the port
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]