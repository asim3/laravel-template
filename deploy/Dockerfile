FROM composer:2.7.7

RUN docker-php-ext-install pdo_mysql

RUN adduser -S -s /bin/bash -u 1000 -D d_user

ENV APP_HOME=/home/d_user/laravel-src

COPY --chown=d_user:d_user --chmod=750 ./src $APP_HOME

USER d_user

WORKDIR $APP_HOME

RUN composer install

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "php artisan serve --host=0.0.0.0 --port=8000" ]
