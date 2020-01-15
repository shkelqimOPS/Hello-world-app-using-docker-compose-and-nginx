FROM node:alpine as build

WORKDIR /src

COPY . /src

FROM node:alpine

WORKDIR /src

COPY --from=build /src/ /src/

EXPOSE 3000

ENTRYPOINT ["node","server.js"]

