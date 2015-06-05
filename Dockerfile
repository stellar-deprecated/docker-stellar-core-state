FROM postgres:9.4.2

MAINTAINER Mat Schaffer <mat@stellar.org>

EXPOSE 5432

RUN mkdir /data
VOLUME /data
