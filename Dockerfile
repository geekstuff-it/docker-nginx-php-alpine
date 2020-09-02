ARG VERSION=1.18-alpine
FROM nginx:${VERSION}

ENV NGINX_ENTRYPOINT_QUIET_LOGS=1 \
    PHP_FPM_HOST=php \
    PHP_FPM_PORT=9000 \
    SERVER_ROOT=/app/public

RUN chown -R nginx: /etc/nginx/conf.d \
 && rm /etc/nginx/conf.d/default.conf \
 && mkdir -p /app/public

WORKDIR /app

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.conf /etc/nginx/templates/server.conf.template

EXPOSE 8080

## nginx user 101
USER 101
