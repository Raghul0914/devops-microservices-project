FROM nginx:latest

COPY ./src/frontend /usr/share/nginx/html

EXPOSE 8080
