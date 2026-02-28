FROM alpine:latest

RUN apk add --no-cache openssl

ARG APP_UID="2000"
ARG APP_GID="2000"
ARG APP_USER="app"
ARG APP_GROUP="app"

RUN \
    addgroup -g "${APP_GID}" "${APP_GROUP}" && \
    adduser \
      -u "${APP_UID}" \
      -g "" \
      -G "${APP_GROUP}" \
      -h "/home/${APP_USER}}" \
      -D \
      -s "/bin/sh" \
      "${APP_USER}"

ENV  \
  HOST_IP="0.0.0.0" \
  PS1="\e[1m\e[31m[\$HOST_IP] \e[34m\u@\h\e[35m \w\e[0m\n$ "

WORKDIR /app

USER app

ENTRYPOINT ["openssl"]
