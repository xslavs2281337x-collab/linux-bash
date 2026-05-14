FROM ubuntu:22.04 AS builder
WORKDIR /app
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \ 
    apt-get install -y curl  
RUN curl -o test.txt https://example.com

FROM python:3.12-alpine
ARG VERSION 
ENV APP_VERSION=${VERSION}
ENV APP_ENV=production
LABEL version="${VERSION}"
WORKDIR /app
COPY --from=builder /app/test.txt . 
COPY server.py  /app/
EXPOSE 8000
RUN adduser -D nonroot
USER nonroot
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD python3 -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1
CMD [ "python3", "server.py" ]

