FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl git && \
    curl -sL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    mkdir /app && \
    cd /app && \
    git clone https://github.com/docker-hy/backend-example-docker.git && \
    apt-get purge -y --auto-remove \
    curl git && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m app && \
    chown -R app /app

USER app
WORKDIR /app/backend-example-docker
RUN npm install

EXPOSE 8000
ENV FRONT_URL=http://localhost:80
CMD npm start