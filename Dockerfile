FROM node:alpine
WORKDIR /usr/src/app
USER root
COPY package*.json ./
RUN npm i
COPY . .
EXPOSE 3000
CMD [ "node", "index.js" ]