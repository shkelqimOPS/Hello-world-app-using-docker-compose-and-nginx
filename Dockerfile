FROM node:alpine as build

WORKDIR /src

COPY . /src

FROM alpine

RUN apk add --no-cache nodejs-current tini

WORKDIR /src

COPY --from=build /src/ /src/

EXPOSE 3000

ENTRYPOINT ["node","server.js"]

