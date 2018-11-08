FROM docker:dind

RUN apk update && apk upgrade

RUN apk add python3
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN python -m pip install --upgrade pip

RUN python -m pip install docker-compose

WORKDIR /code

RUN mkdir db_data

ADD docker-compose.yml .
