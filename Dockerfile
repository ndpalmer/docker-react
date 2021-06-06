FROM node:16-alpine3.13 as builder
WORKDIR '/app'
COPY package.json /app
RUN npm install pm@latest -g
COPY . /app
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html