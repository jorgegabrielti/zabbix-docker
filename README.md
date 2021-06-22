# Zabbix Docker

Download the project
```bash
git clone https://github.com/jorgegabrielti/zabbix-docker.git
```

```bash
cd zabbix-docker/scripts
./boot-strap.sh
```

### Docker Compose File
Create a new docker network 
```bash
docker network create --driver bridge monitoring
```

```bash
docker-compose up -d
```
