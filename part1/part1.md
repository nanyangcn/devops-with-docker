# Part 1

## 1.1

```console
❯ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS                      PORTS     NAMES
6e92ca692094   nginx     "/docker-entrypoint.…"   About a minute ago   Exited (0) 37 seconds ago             elegant_banzai
da8d45ccf5dc   nginx     "/docker-entrypoint.…"   About a minute ago   Exited (0) 37 seconds ago             agitated_goldwasser
30300c08aae4   nginx     "/docker-entrypoint.…"   About a minute ago   Up About a minute           80/tcp    practical_dirac
```

## 1.2

```console
❯ docker ps -as
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES     SIZE

❯ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

## 1.3

```console
❯ docker run -it devopsdockeruh/pull_exercise
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
8e402f1a9c57: Pull complete
5e2195587d10: Pull complete
6f595b2fc66d: Pull complete
165f32bf4e94: Pull complete
67c4f504c224: Pull complete
Digest: sha256:7c0635934049afb9ca0481fb6a58b16100f990a0d62c8665b9cfb5c9ada8a99f
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest

Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"

❯ docker container ps -a
CONTAINER ID   IMAGE                          COMMAND           CREATED         STATUS                      PORTS     NAMES
346a2c0de956   devopsdockeruh/pull_exercise   "node index.js"   2 minutes ago   Exited (0) 56 seconds ago             brave_wright
```

## 1.4

```console
❯ docker run -d -it --rm --name ex1.4 devopsdockeruh/exec_bash_exercise
f60adcd6dba49cac0e806708bec1b701c55eac2ab3c92c03aa4ad80aae761806

❯ docker exec -it ex1.4 bash
root@f60adcd6dba4:/usr/app# tail -f logs.txt
Tue, 29 Dec 2020 08:51:04 GMT
Tue, 29 Dec 2020 08:51:07 GMT
Tue, 29 Dec 2020 08:51:10 GMT
Tue, 29 Dec 2020 08:51:13 GMT
Secret message is:
"Docker is easy"
```

## 1.5

```console
❯ docker run -d -it --rm ubuntu:16.04
2689424168c45566299d8e4f096246995b77d7f86c1502e1e7e166eec4378a88

❯ docker exec -it 26 bash
root@2689424168c4:/# apt update
root@2689424168c4:/# apt upgrade
root@2689424168c4:/# apt install curl

root@2689424168c4:/# sh -c 'echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
```

## 1.6

```console
❯ docker build -t docker-clock .
[+] Building 0.1s (5/5) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                   0.0s
 => => transferring dockerfile: 101B                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                        0.0s
 => [internal] load metadata for docker.io/devopsdockeruh/overwrite_cmd_exercise:latest                                                                0.0s
 => CACHED [1/1] FROM docker.io/devopsdockeruh/overwrite_cmd_exercise                                                                                  0.0s
 => exporting to image                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                0.0s
 => => writing image sha256:5a90f67d0231e8436ce5009aed58c1c2e80e8c7dcdd8c2cf4e1849ae1b166e0f                                                           0.0s
 => => naming to docker.io/library/docker-clock                                                                                                        0.0s

❯ docker run docker-clock
1
2
3
4
5
```

## 1.7

```console
❯ docker build -t curler .
[+] Building 0.1s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                   0.0s
 => => transferring dockerfile: 247B                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/ubuntu:16.04                                                                                        0.0s
 => [1/4] FROM docker.io/library/ubuntu:16.04                                                                                                          0.0s
 => CACHED [2/4] RUN apt update && apt install -y curl                                                                                                 0.0s
 => CACHED [3/4] RUN printf 'echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;' > curler.sh                      0.0s
 => CACHED [4/4] RUN chmod +x curler.sh                                                                                                                0.0s
 => exporting to image                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                0.0s
 => => writing image sha256:d645833d439eec63dcf1c6f007ce65a5e293ed264ff3d57c2abe67e0e6429406                                                           0.0s
 => => naming to docker.io/library/curler

 ❯ docker run -it curler
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
```

## 1.8

```console
❯ notepad logs.txt

❯ ll
-a---        29/12/2020     17.45       64   1.6_Dockerfile
-a---        29/12/2020     18.01      208   1.7_Dockerfile
-a---        29/12/2020     20.47        0   logs.txt
-a---        29/12/2020     18.00     6,49KB part1.md

❯ docker run -it -v "$(pwd)/logs.txt:/usr/app/logs.txt" devopsdockeruh/first_volume_exercise
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file

❯ more .\logs.txt
Tue, 29 Dec 2020 18:48:05 GMT
Tue, 29 Dec 2020 18:48:08 GMT
Tue, 29 Dec 2020 18:48:11 GMT
```

## 1.9

```console
❯ docker run -d -p 3002:80 devopsdockeruh/ports_exercise
8a467a2704293483b455531eef6907fa9d6f2d9a7252b8f32c0c5ae86efd18d8

❯ curl localhost:3002
Ports configured correctly!!
```

## 1.11

```console
❯ docker run -v "$(pwd)/logs.txt:/backend-example-docker/logs.txt" -it --rm -p 8000:8000 ex1.11

> backend-example-docker@1.0.0 start /backend-example-docker
> node index.js

ENV values set as follows: {
  DB: {
    username: undefined,
    password: undefined,
    database: undefined,
    host: 'localhost'
  },
  PORT: 8000,
  FRONT_URL: '',
  REDIS: undefined,
  REDIS_PORT: 6379
}
[Exercise 2.6+] DB_USERNAME and/or DB_PASSWORD are not defined, skipping db connection
[Exercise 2.5+] REDIS is not defined, skipping redis connection
Started on port 8000
::ffff:172.17.0.1 - GET / HTTP/1.1 200 56 - 32.128 ms
::ffff:172.17.0.1 - GET /favicon.ico HTTP/1.1 404 150 - 1.947 ms
::ffff:172.17.0.1 - GET / HTTP/1.1 304 - - 6.896 ms
::ffff:172.17.0.1 - GET / HTTP/1.1 304 - - 5.960 ms
::ffff:172.17.0.1 - GET / HTTP/1.1 304 - - 5.423 ms
^C
```

## 1.12

```console
❯ docker build -t ex1.12-front .
❯ docker build -t ex1.12-back .
❯ docker run -it --rm -p 8000:8000 ex1.12-back
❯ docker run -it --rm -p 5000:5000 ex1.12-front
```

## 1.15

DockerHub: [https://hub.docker.com/repository/docker/nanyangcn/blog-list](https://hub.docker.com/repository/docker/nanyangcn/blog-list)

## 1.16

Heroku app: [https://devops-docker-heroku.herokuapp.com/](https://devops-docker-heroku.herokuapp.com/)

## 1.17

DockerHub: [https://hub.docker.com/repository/docker/nanyangcn/c-and-cpp](https://hub.docker.com/repository/docker/nanyangcn/c-and-cpp)

This images build for C/C++ programming language environment.