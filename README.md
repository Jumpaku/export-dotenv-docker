# export-dotenv-docker

## Load default .env

The .env in the directory mounted to /dotenv is loaded.

```sh
echo 'ABC=xyz' > .env
env $(docker run -v $(pwd):/dotenv jumpaku/export-dotenv-docker) sh -c 'echo ${ABC}'
# => xyz
```

## Load specified dotenv file

The specified file in the directory mounted to /dotenv is loaded.

```sh
echo 'ABC=xyz' > .env.example
env $(docker run -v $(pwd):/dotenv jumpaku/export-dotenv-docker .env.example) sh -c 'echo ${ABC}'
# => xyz
```

## Load .env included in specified directory

The .env in the specified directory is loaded if the directory is mounted to /dotenv.

```sh
mkdir -p example
echo 'ABC=xyz' > example/.env
env $(docker run -v $(pwd):/dotenv jumpaku/export-dotenv-docker example) sh -c 'echo ${ABC}'
# => xyz
```
