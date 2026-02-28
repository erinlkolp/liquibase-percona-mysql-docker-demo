FROM liquibase/liquibase:4.31.0

LABEL org.opencontainers.image.description="Liquibase with Percona Toolkit for online schema changes"
LABEL org.opencontainers.image.source="https://github.com/erinlkolp/liquibase-percona-mysql-docker-demo"

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    perl \
    libdbi-perl \
    libdbd-mysql-perl \
    libterm-readkey-perl \
    libio-socket-ssl-perl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget -q https://downloads.percona.com/downloads/percona-toolkit/3.7.0/binary/debian/jammy/x86_64/percona-toolkit_3.7.0-1.jammy_amd64.deb && \
    dpkg -i percona-toolkit_3.7.0-1.jammy_amd64.deb && \
    rm percona-toolkit_3.7.0-1.jammy_amd64.deb

USER liquibase

ENV PATH=/liquibase/:$PATH

RUN wget -q -O /liquibase/lib/liquibase-percona-4.31.0.jar \
    https://github.com/liquibase/liquibase-percona/releases/download/v4.31.0/liquibase-percona-4.31.0.jar
