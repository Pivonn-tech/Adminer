# Use the official PHP image
FROM php:8.1-cli

# Set the working directory
WORKDIR /app

# Copy the adminer.php file into the container
COPY adminer.php .

# Expose the port
EXPOSE 10000

# Start the PHP built-in server
CMD ["php", "-S", "0.0.0.0:10000", "adminer.php"]