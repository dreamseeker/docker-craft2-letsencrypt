FROM php:7.1-apache

#
# PHP Configuration
#
# install PHP modules
# ----------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nano \
        libicu-dev \
        zlib1g-dev \
        wget \
        zip \
        unzip \
        sudo \
        git \
        imagemagick \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql


# install GD
# ----------
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd


# install Imagemagick & PHP Imagick ext
# ----------
RUN apt-get install -y --no-install-recommends \
        libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick


# install Modules for Craft 2
# ----------
RUN apt-get install -y \
        libmcrypt-dev \
    && docker-php-ext-install iconv \
    && docker-php-ext-install mcrypt


# cleanup
# ----------
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# enable mod_rewite
# ----------
RUN a2enmod rewrite
