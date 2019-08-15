#!/usr/bin/env bash
docker pull tenforce/virtuoso
docker stop lsq-sparql-endpoint || true
docker rm -f lsq-sparql-endpoint || true
docker run --name lsq-sparql-endpoint \
    -p 8890:8890 -p 1111:1111 \
    -e SPARQL_UPDATE=true \
    -e DEFAULT_GRAPH= \
    -v /my/path/to/the/virtuoso/db:/data \
    -d tenforce/virtuoso