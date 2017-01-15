FROM python:2.7
MAINTAINER BBVALabs <enrique.garcia.pablos@bbva.com>

WORKDIR /root

ADD requirements.txt requirements.txt
ADD constraints.txt constraints.txt

RUN pip install -U pip
RUN pip install -r requirements.txt -c constraints.txt

CMD ["/bin/bash"]
