FROM composer:2.7.7

WORKDIR /repo/

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "composer create-project laravel/laravel src \
       && mv ./init/testing.yml ./.github/workflows/testing.yml \
       && rm ./.github/workflows/test-init-project.yml \
       && rm -rf ./init" \
    ]
