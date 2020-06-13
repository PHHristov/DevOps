FROM postgres:9.6.1

RUN mkdir -p /usr/local/pgsql/data
ENV GOSU_VERSION=1.7

RUN /bin/sh -c set -x && \
/bin/sh -c apt-get update 
ENV LANG=en_US.utf8
RUN /bin/sh -c mkdir /docker-entrypoint-initdb.d && \
/bin/sh -c set -ex; key='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8'
ENV PG_MAJOR=9.6
ENV PG_VERSION=9.6.1-2.pgdg80+1
RUN /bin/sh -c echo 'deb http://apt.postgresql.org/pub/repos/apt/' && \
/bin/sh -c apt-get update && \
/bin/sh -c mv -v /usr/share/postgresql/$PG_MAJOR/pos && \
/bin/sh -c mkdir -p /var/run/postgresql 
ENV PATH=/usr/lib/postgresql/9.6/bin:/usr/local/sbin:/usr
ENV PGDATA=/var/lib/postgresql/data
RUN /bin/sh -c mkdir -p "$PGDATA"


VOLUME [C:\Users\phristov\git\DevOps\Docker\postgres:/var/lib/postgresql/data]


ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 5432/tcp
CMD ["postgres"]