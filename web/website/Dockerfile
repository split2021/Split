FROM node:lts-alpine

WORKDIR /web

ENV PATH /web/node_modules/.bin:$PATH

COPY package.json /web

RUN npm install yarn

#RUN yarn install --network-timeout 1000000

COPY . /web/
