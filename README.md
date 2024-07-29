# Laravel Template 


## create laravel project 
```bash
docker image prune

docker image build -t init/create-laravel-project:latest init

docker run --rm -it -v '.:/home/d_user' init/create-laravel-project:latest
```


## run laravel project
```bash
docker compose up
```
