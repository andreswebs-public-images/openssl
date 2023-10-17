FROM alpine:latest

RUN apk add --no-cache openssl

ARG PUID=1000
ARG PGID=1000

RUN \
    addgroup -g "${PGID}" app && \
    adduser \
      -u "${PUID}" \
      -G app \
      -h /app \
      -D \
      app

ENV  \
  HOST_IP="0.0.0.0" \
  PS1="\e[1m\e[31m[\$HOST_IP] \e[34m\u@\h\e[35m \w\e[0m\n$ "

WORKDIR /app

USER app

ENTRYPOINT ["openssl"]
