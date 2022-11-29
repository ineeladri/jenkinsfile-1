FROM node:18-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build:prod
# Stage 2
#FROM nginx
#COPY --from=build-step /app/dist/claims /usr/share/nginx/html
FROM fholzer/nginx-brotli
COPY --from=build-step /app/dist/claims /usr/share/nginx/html
#CMD ["nginx", "-g", "daemon off;"]
