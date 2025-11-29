FROM nginx:latest

WORKDIR /usr/local/app

COPY ./index.html index.html

EXPOSE 80

RUN useradd worst
USER worst
