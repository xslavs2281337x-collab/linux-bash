FROM python:3.9-slim
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y wget
WORKDIR /app
COPY index.html .
CMD [ "python3", "-m", "http.server", "5003" ]