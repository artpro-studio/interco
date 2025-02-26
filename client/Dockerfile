FROM node:20-alpine As development

WORKDIR /usr/src/client

COPY package*.json ./

RUN npm install glob rimraf

RUN npm install

COPY . .

RUN npm run build:prod

FROM node:20-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/client

COPY package*.json ./

RUN npm install --only=production

COPY . .

COPY --from=development /usr/src/client/dist ./dist

CMD ["node", "dist/main"]
