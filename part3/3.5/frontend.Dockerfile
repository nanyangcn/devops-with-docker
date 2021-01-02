FROM node:alpine

RUN apk add --no-cache git && \
    mkdir /app && \
    cd /app && \
    git clone https://github.com/docker-hy/frontend-example-docker.git && \
    apk del git && \
    adduser -D app && \
    npm install -g serve && \
    chown -R app /app /usr/local/lib/node_modules/serve

USER app
WORKDIR /app/frontend-example-docker
RUN npm ci && \
    npm run build && \
    rm -r ./node_modules

EXPOSE 5000
ENV API_URL=http://localhost:80
CMD ["serve", "-s", "-l", "5000", "dist"]