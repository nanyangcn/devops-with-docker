FROM node:alpine

RUN apk add --no-cache git && \
    mkdir /app && \
    cd /app && \
    git clone https://github.com/docker-hy/backend-example-docker.git && \
    apk del git && \
    adduser -D app && \
    chown -R app /app

USER app
WORKDIR /app/backend-example-docker
RUN npm install

EXPOSE 8000
ENV FRONT_URL=http://localhost:80
CMD npm start