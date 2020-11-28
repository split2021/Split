FROM node:lts-alpine

RUN npm install yarn

WORKDIR /web

COPY package*.json /web

RUN yarn install --network-timeout 1000000

COPY . /web

# CMD ["yarn", "start"]

