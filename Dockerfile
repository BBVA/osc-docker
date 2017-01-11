FROM python:2.7
MAINTAINER BBVALabs <enrique.garcia.pablos@bbva.com>

WORKDIR /root

ADD requirements.txt requirements.txt

RUN pip install -U pip
RUN pip install -r requirements.txt

CMD ["/bin/bash"]
