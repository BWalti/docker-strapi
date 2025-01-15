# BASE
ARG NODE_VERSION=18
ARG STRAPI_VERSION=latest

FROM node:${NODE_VERSION}-alpine3.18 AS base-alpine

# From https://docs.strapi.io/dev-docs/installation/docker#development-andor-staging-environments
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
RUN npm i -g node-gyp
RUN npm i -g create-strapi

RUN mkdir -p /app && chown 1000:1000 -R /app
WORKDIR /app
VOLUME /app

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh 
# && ln -s /usr/local/bin/docker-entrypoint.sh

EXPOSE 1337
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["strapi"]
