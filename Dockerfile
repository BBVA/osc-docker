FROM python:2.7-alpine
MAINTAINER BBVALabs
LABEL authors="engapa@gmail.com, leti.garcia.martin@gmail.com"

WORKDIR /root

ADD requirements.txt requirements.txt
ADD constraints.txt constraints.txt

RUN set -x \
    && apk add --no-cache --virtual .build-deps \
       bash gcc make python-dev linux-headers ca-certificates \
       build-base musl libffi libffi-dev openssl-dev \
    && pip install -U pip \
    && pip install -r requirements.txt -c constraints.txt \
    && apk del .build-deps

CMD ["/bin/sh"]
