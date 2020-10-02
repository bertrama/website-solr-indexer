FROM debian:latest

RUN apt-get update && \
    apt-get install -y curl --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app /data
WORKDIR /app
COPY . /app

ARG SOLR_URL=http://website-solr:8080/solr/www.lib
ARG DATADIR=/data
ENV SOLR_URL=${SOLR_URL} \
    DATADIR=${DATADIR}

CMD bin/index-data-dir
