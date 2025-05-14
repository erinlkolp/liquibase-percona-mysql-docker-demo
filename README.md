![Continuous Integration](https://github.com/erinlkolp/liquibase-percona-mysql-docker-demo/actions/workflows/main.yml/badge.svg)

# erinlkolp / liquibase-percona-mysql-docker-demo

![](https://miro.medium.com/max/491/1*fwQrAHSeYhoQ1xaAjX5sTQ.jpeg)

A **template** for CI/CD using Liquibase, Docker, and GitHub Actions for Continuous Integration and Deployment.

### To build this, type:
```
docker-compose build
```

### To run this, type:
```
docker-compose up db -d
sleep 20
docker-compose up liquibase
```

### To stop this, type:
```
docker-compose down
```
