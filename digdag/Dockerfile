FROM azul/zulu-openjdk:8

ENV DEBIAN_FRONTEND noninteractive
ENV TERM dumb

WORKDIR /bootstrap
COPY bootstrap /bootstrap
RUN ./dependencies.sh

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

