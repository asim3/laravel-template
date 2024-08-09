FROM composer:2.7.7

RUN docker-php-ext-install pdo_mysql

RUN adduser -S -s /bin/bash -u 1000 -D d_user

USER d_user

WORKDIR /home/d_user/laravel-src

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "php artisan serve --host=0.0.0.0 --port=8000" ]
