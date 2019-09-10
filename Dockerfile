FROM node:lts-alpine

MAINTAINER Damien Duboeuf <smeagolworms4@gmail.com>


ADD node_modules /usr/share/openstreetmap-proxy/node_modules
ADD dist/index.js /usr/share/openstreetmap-proxy/dist/index.js

WORKDIR /usr/share/openstreetmap-proxy/dist

ENV OSM_PROXY_PORT=80
ENV OSM_PROXY_CACHE_PATH=/var/cache/openstreetmap-proxy
ENV OSM_PROXY_LAYER_URL=http://{s}.{type}.openstreetmap.org/{z}/{x}/{y}.png
ENV OSM_PROXY_CACHE_LIFETIME=2592000

EXPOSE 80

CMD node index.js $OSM_PROXY_PORT $OSM_PROXY_CACHE_PATH $OSM_PROXY_LAYER_URL $OSM_PROXY_CACHE_LIFETIME