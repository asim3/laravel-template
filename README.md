# Laravel Template


## Create Laravel Project
```bash
docker image build -t init/create-laravel-project:latest init

docker run --rm -it -v '.:/home/d_user' init/create-laravel-project:latest
```


## Run Laravel
```bash
docker compose up --build --force-recreate

# EXEC
docker compose exec app /bin/bash 
```


## delete
```bash
php artisan package:discover --ansi
php artisan vendor:publish --tag=laravel-assets --ansi --force
php artisan key:generate --ansi
php artisan migrate --graceful --ansi
```
