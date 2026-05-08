FROM python:3.12-alpine

RUN apk add --no-cache apache2-utils \
    && pip install --no-cache-dir radicale==3.* passlib[bcrypt] 

RUN adduser -D -h /data radicale

COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

USER radicale
WORKDIR /data

EXPOSE 5232

ENTRYPOINT ["/entrypoint.sh"]
