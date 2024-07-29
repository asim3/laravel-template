FROM composer:2.7.7 AS build

RUN adduser -S -s /bin/bash -u 1000 -D d_user

USER d_user

WORKDIR /home/d_user

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "cd /home/d_user/laravel-project && php artisan serve" ]
