FROM composer:2.7.7 AS build

RUN adduser -S -s /bin/bash -u 1010 -D d_user

COPY --chown=d_user:d_user --chmod=750 ./src /repo/src

USER d_user

WORKDIR /repo/src

RUN composer install



FROM php:8.2-cli AS main

RUN pecl install redis && pecl install xdebug

RUN docker-php-ext-enable redis xdebug

ENV APP_HOME=/repo/src

RUN adduser --system --shell /bin/bash --uid 1010 --group --disabled-password --disabled-login d_user

COPY --from=build --chown=d_user:d_user --chmod=750 $APP_HOME $APP_HOME

USER d_user

ENV XDEBUG_MODE=coverage

WORKDIR $APP_HOME

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "php artisan test --coverage --min=90" ]
