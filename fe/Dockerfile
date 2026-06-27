FROM node:24-alpine AS build

WORKDIR /app

ARG VITE_API_BASE_URL=
ARG VITE_GOOGLE_CLIENT_ID=

ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
ENV VITE_GOOGLE_CLIENT_ID=$VITE_GOOGLE_CLIENT_ID

COPY fe/package*.json ./
RUN npm ci

COPY fe ./
RUN npm run build

FROM nginx:alpine

COPY fe/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
