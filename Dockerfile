ARG BASE=node:17-alpine
FROM $BASE AS base
USER node
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production
COPY . .
EXPOSE 3000

FROM base as dev
CMD yarn install && yarn dev
