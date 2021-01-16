FROM node:lts

RUN git clone https://github.com/nanyangcn/blog-list-pipeline
WORKDIR /blog-list-pipeline
RUN yarn
RUN yarn build

EXPOSE 3001
ENV MONGODB_URI=
ENV PORT=3001
ENV SECRET=hqwu123-9u*^Y#*)@H3gog
ENV TEST_MONGODB_URI=
CMD yarn start-prod
