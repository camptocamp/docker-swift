FROM debian:jessie

ENV OS_AUTH_URL ""
ENV OS_TENANT_NAME ""
ENV OS_USERNAME ""
ENV OS_PASSWORD ""

ENV PIPE_NAME "/tmp/share/pipe"

RUN apt-get update \
  && apt-get install -y curl python \
  && rm -rf /var/lib/apt/lists/*

VOLUME [ "/tmp/share" ]

COPY docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
