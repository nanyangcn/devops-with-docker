FROM node:alpine

RUN apk add --no-cache git && \
    mkdir /app && \
    cd /app && \
    git clone https://github.com/nanyangcn/blog-list-pipeline && \
    apk del git && \
    adduser -D app && \
    chown -R app /app

USER app
WORKDIR /app/blog-list-pipeline
RUN yarn && \
    yarn build && \
    rm -r /app/blog-list-pipeline/client

EXPOSE 3001
ENV MONGODB_URI=
ENV PORT=3001
ENV SECRET=hqwu123-9u*^Y#*)@H3gog
ENV TEST_MONGODB_URI=
CMD yarn start-prod
