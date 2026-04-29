FROM ubuntu:22.04 AS builder 
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y curl
WORKDIR /url
RUN curl -o ./url.txt https://ifconfig.me

FROM ubuntu:22.04
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y nginx
COPY --from=builder /url/url.txt /var/www/html/index.html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
