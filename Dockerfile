FROM node:alpine as build

WORKDIR /src

COPY package.json /src

COPY . /src

RUN npm install

FROM alpine

RUN apk add --no-cache nodejs-current tini

WORKDIR /src

COPY --from=build /src/ /src/

EXPOSE 3000

ENTRYPOINT ["node","server.js"]
 
