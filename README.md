# export-dotenv-docker

Docker image that supports to pass environment variables defined by dotenv file to `env` command.

## Using docker image

### Load default .env

The `.env` is loaded if the file is mounted to `/dotenv/.env` or the parent directory of the file is mounted to `/dotenv`.

```sh
echo 'ABC=xyz' > .env
env $(docker run -v $(pwd):/dotenv jumpaku/export-dotenv-docker) sh -c 'echo ${ABC}'
# => xyz
```

```sh
echo 'ABC=xyz' > .env.example
env $(docker run -v $(pwd)/.env.example:/dotenv/.env jumpaku/export-dotenv-docker) sh -c 'echo ${ABC}'
# => xyz
```

### Load specified dotenv file

The specified dotenv file is loaded if an ancestor directory of the file is mounted to `/dotenv`.

```sh
echo 'ABC=xyz' > .env.example
env $(docker run -v $(pwd):/dotenv jumpaku/export-dotenv-docker .env.example) sh -c 'echo ${ABC}'
# => xyz
```

### Load .env included in specified directory

The `.env` in the specified directory is loaded if an ancestor directory of the directory is mounted to `/dotenv`.

```sh
mkdir -p example
echo 'ABC=xyz' > example/.env
env $(docker run -v $(pwd):/dotenv jumpaku/export-dotenv-docker example) sh -c 'echo ${ABC}'
# => xyz
```

## Using script

### Install:

```sh
npm install -g @jumpaku/export-dotenv
```

### Usage:

```sh
export-dotenv [<dotenv-or-dir-including-dotnev>]
```

### Options:

*  `-h`, `--help`  display help for command

### Examples


```sh
# The `./.env` is loaded.
echo 'ABC=xyz' > .env
env $(export-dotenv) sh -c 'echo ${ABC}'
# => xyz
```

```sh
# The specified dotenv file is loaded.
echo 'ABC=xyz' > .env.example
env $(export-dotenv .env.example) sh -c 'echo ${ABC}'
# => xyz
```


```sh
# The `.env` in the specified directory is loaded.
mkdir -p example
echo 'ABC=xyz' > example/.env
env $(export-dotenv example) sh -c 'echo ${ABC}'
# => xyz
```