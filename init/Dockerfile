FROM composer:2.7.7

RUN adduser -S -s /bin/bash -u 1000 -D d_user

USER d_user

WORKDIR /home/d_user

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "composer create-project laravel/laravel src && rm -rf ./init" ]
