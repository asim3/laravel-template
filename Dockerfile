FROM serversideup/php:8.2-cli-bookworm AS build

USER root

RUN apt-get update && apt-get install -y git libzip-dev libpng-dev librdkafka-dev

RUN pecl install rdkafka

RUN docker-php-ext-install exif sockets gd

RUN docker-php-ext-enable exif sockets rdkafka

WORKDIR /

RUN git clone -b v4.10.0 --depth 1 --single-branch https://github.com/ProcessMaker/processmaker.git

RUN cd /processmaker && composer install

RUN cd /processmaker \
      && cp .env.example .env \
      && php artisan key:generate --ansi \
      && sed -i -e 's/DB_CONNECTION=sqlite/DB_CONNECTION=mysql/' ./.env \
      && sed -i -e 's/# DB_HOST=127.0.0.1/DB_HOST=db-mysql/' ./.env \
      && sed -i -e 's/# DB_PORT=3306/DB_PORT=3306/' ./.env \
      && sed -i -e 's/# DB_DATABASE=laravel/DB_DATABASE=laravel/' ./.env \
      && sed -i -e 's/# DB_USERNAME=root/DB_USERNAME=admin/' ./.env \
      && sed -i -e 's/# DB_PASSWORD=/DB_PASSWORD=admin/' ./.env \
      && php artisan vendor:publish --tag=laravel-assets --ansi --force



FROM composer:2.7.7 AS main

RUN docker-php-ext-install pdo_mysql

RUN adduser -S -s /bin/bash -u 1000 -D d_user

USER d_user

COPY --from=build --chown=d_user:www-data --chmod=750 /processmaker /laravel-src

WORKDIR /laravel-src

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "php artisan serve --host=0.0.0.0 --port=8000" ]
