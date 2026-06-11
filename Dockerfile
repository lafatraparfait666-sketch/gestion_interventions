FROM php:8.2-apache
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip git libicu-dev && docker-php-ext-install pdo pdo_mysql gd intl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite
COPY . /var/www/html/
WORKDIR /var/www/html
RUN composer install --no-dev --optimize-autoloader
RUN chown -R www-data:www-data /var/www/html
RUN sed -ri -e 's!/var/www/html!/var/www/html/webroot!g' /etc/apache2/sites-available/*.conf
EXPOSE 80