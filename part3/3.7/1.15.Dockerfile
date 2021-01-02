FROM node:lts

RUN git clone https://github.com/nanyangcn/blog-list-pipeline
WORKDIR /blog-list-pipeline
RUN yarn
RUN yarn build

EXPOSE 3001
ENV MONGODB_URI=mongodb+srv://nanyangcn:nan1993yang5630@cluster0.t5hgs.mongodb.net/blog-list?retryWrites=true&w=majority
ENV PORT=3001
ENV SECRET=hqwu123-9u*^Y#*)@H3gog
ENV TEST_MONGODB_URI=mongodb+srv://nanyangcn:nan1993yang5630@cluster0.t5hgs.mongodb.net/blog-list-test?retryWrites=true&w=majority
CMD yarn start-prod