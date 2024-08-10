# Laravel Template


## Create Laravel Project
```bash
docker image build -t init/create-laravel-project:latest ./init

docker run --rm -u 1000:1000 -it -v '.:/repo' init/create-laravel-project:latest
```


## Run Laravel
```bash
docker compose up --build --force-recreate

# EXEC
docker compose exec app /bin/bash 
```
