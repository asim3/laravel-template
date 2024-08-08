FROM composer:2.7.7 AS build

RUN adduser -S -s /bin/bash -u 1000 -D d_user

USER d_user

WORKDIR /home/d_user/laravel-project

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "php artisan serve --host=0.0.0.0 --port=8000" ]
