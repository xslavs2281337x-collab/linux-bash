# NGINX Reverse Proxy + Upstream

## Описание

Учебный стенд на Docker Compose с NGINX в роли reverse proxy.

В стенде настроены:

- 2 backend-сервиса, объединённые через `upstream`;
- 1 отдельный backend-сервис;
- отдельный маршрут для статических файлов;
- healthcheck для backend-контейнеров;
- ограничение Docker-логов через `json-file`;
- проверка нагрузки через ApacheBench.

## Схема работы

```text
Client
  |
  v
NGINX reverse proxy
  |
  +--> upstream backend_alpha
  |       +--> service1
  |       +--> service2
  |
  +--> service3
