# Stage 1: Build React/Vite app
FROM node:22-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# VITE_API_BASE_URL="" → config.ts sẽ dùng window.location.origin
# nginx proxy /api/ → backend nên FE không cần biết URL backend trực tiếp
ARG VITE_API_BASE_URL=""
ARG VITE_GOOGLE_CLIENT_ID=""

RUN VITE_API_BASE_URL="$VITE_API_BASE_URL" \
    VITE_GOOGLE_CLIENT_ID="$VITE_GOOGLE_CLIENT_ID" \
    npm run build

# Stage 2: Serve với nginx
FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
