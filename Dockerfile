FROM node:alpine as build

WORKDIR /src

COPY package*.json server.js /src/

RUN npm install

FROM alpine

RUN apk add --no-cache nodejs-current tini

WORKDIR /src

COPY --from=build /src/ /src/

USER app

ENTRYPOINT ["node","server.js"]
 
