## О проекте



Production-like инфраструктура для self-hosted Git-сервиса в Docker Compose. 
Nginx работает как reverse proxy перед Gitea, которая хранит данные в базе 
PostgreSQL. Стек использует сегментацию сетей (изолированные frontend и backend 
сети), управление секретами через переменные окружения, persistent volumes для 
данных и healthcheck-зависимости при старте.

```mermaid

graph TB
    Client[Клиент / Browser] -->|:80| Nginx
    
    subgraph frontend["frontend сеть"]
        Nginx[Nginx<br/>:80]
        Gitea_fe[Gitea]
    end
    
    subgraph backend["backend сеть · internal: true"]
        Gitea_be[Gitea]
        Postgres[PostgreSQL<br/>:5432]
    end
    
    Nginx -->|/git/ sub-path| Gitea_fe
    Gitea_fe -.gitea в обеих сетях.-> Gitea_be
    Gitea_be -->|подключение к БД| Postgres
    
    Postgres -.named volume.-> Volume[(pgdata)]
    Gitea_be -.named volume.-> GiteaVol[(gitea-data)]
    
    Postgres -.опционально для дева.-> Host[Хост :5432]




```

---
