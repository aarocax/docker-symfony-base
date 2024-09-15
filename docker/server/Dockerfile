FROM nginx:1.27.1

LABEL name="nginx-docker-symfony-base"

ARG UID
EXPOSE $UID

RUN adduser -u ${UID} --disabled-password --gecos "" appuser

COPY default.conf /etc/nginx/conf.d/