# Use the official Node.js 20.18.0 image as the base image
FROM node:20.18.1 AS builder

# Set the working directory inside the container
WORKDIR /usr/src/app
COPY . .

RUN npm install --legacy-peer-deps
RUN NODE_OPTIONS=--max-old-space-size=8192 npm run build

FROM nginx:alpine
COPY --from=builder //usr/src/app/dist /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

