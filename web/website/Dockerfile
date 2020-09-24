FROM node:lts-alpine

RUN npm install yarn

WORKDIR /web

COPY package*.json /web

RUN yarn install

COPY . /web

# CMD ["yarn", "start"]

