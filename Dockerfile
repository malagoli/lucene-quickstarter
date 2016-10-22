FROM java:7

MAINTAINER  Sandro Athaide Coelho <sandroacoelho@gmail.com

RUN apt-get update && apt-get install -y \
    curl \
    maven \
    bzip2

RUN mkdir -p /mnt/lucene-quickstarter
COPY ./dbpedia-spotlight /mnt/lucene-quickstarter/dbpedia-spotlight
RUN cd /mnt/lucene-quickstarter/dbpedia-spotlight && \
    mvn clean install

COPY ./scripts /mnt/lucene-quickstarter/scripts
COPY ./i18n /mnt/lucene-quickstarter/i18n
WORKDIR /mnt/lucene-quickstarter/scripts

