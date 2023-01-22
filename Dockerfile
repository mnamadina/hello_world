# base image
FROM python:3.10-alpine

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install requirements
RUN apk add --update-cache \
 make automake gcc g++ linux-headers subversion python3-dev gcc libc-dev gmp-dev libffi-dev tzdata
ENV TZ="America/New_York"
RUN cp /usr/share/zoneinfo/America/New_York /etc/localtime
RUN export LDFLAGS="-L/usr/local/opt/openssl/lib -L /usr/local/opt/gmp/lib"
RUN export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/gmp/include"
RUN pip install --upgrade pip

RUN pip install pytz

RUN apk add openjdk11-jre
COPY . /usr/src/app