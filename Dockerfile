FROM ubuntu:22.04 AS build
USER root

RUN apt update && apt-get install telnet wget perl libdbi-perl libdbd-mysql-perl libterm-readkey-perl libio-socket-ssl-perl -y

RUN wget https://downloads.percona.com/downloads/percona-toolkit/3.7.0/binary/debian/jammy/x86_64/percona-toolkit_3.7.0-1.jammy_amd64.deb && \
   dpkg -i percona-toolkit_3.7.0-1.jammy_amd64.deb

FROM liquibase/liquibase:4.31.0

ENV PATH=/liquibase/:$PATH

COPY --from=build /usr/bin/ /usr/bin/
COPY --from=build /usr/lib/ /usr/lib/
COPY --from=build /opt/ /opt/
COPY --from=build /usr/share/ /usr/share/

USER liquibase

RUN wget -O /liquibase/lib/liquibase-percona-4.31.0.jar https://github.com/liquibase/liquibase-percona/releases/download/v4.31.0/liquibase-percona-4.31.0.jar

