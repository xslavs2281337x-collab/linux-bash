FROM alpine:latest
RUN --mount=type=cache,target=/var/cache/apk,sharing=locked \
    apk update && apk add --no-cache nginx wget
RUN adduser -D -u 1000 webuser && chown -R webuser:webuser /var/log/nginx/ /var/lib/nginx/ /run 
USER webuser
CMD [ "nginx", "-g", "daemon off;" ]
HEALTHCHECK --interval=30s CMD  ("wget", "--spider", "-q", "http://localhost:80")