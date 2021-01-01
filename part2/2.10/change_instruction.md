# 2.10

This is the instruction of file changes of exercise 2.10 from files in 2.8.

## backend dockerfile change

```docker
ENV FRONT_URL=http://localhost:5000
```
to nginx location
```docker
ENV FRONT_URL=http://localhost:80
```
## frontend dockerfile change
```docker
ENV API_URL=http://localhost:8000
```
to nginx location
```docker
ENV API_URL=http://localhost:80
```

## nginx.conf change

Add `/slow`, `/ping`, `/messages` locations to proxy_pass: http://backend:8000