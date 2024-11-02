# Use the official PHP image with Apache
FROM php:8.0-apache

# Install PostgreSQL extensions
RUN docker-php-ext-install pdo pdo_pgsql

# Copy the Adminer PHP file to the appropriate directory
COPY adminer.php /var/www/html/adminer.php

# Expose the port
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]