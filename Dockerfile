# Docker image for StopWatcher v3

# docker-compose build stopwatcherv3
# docker-compose up -d stopwatcherv3
# CMD: python3 stop_watcher.py

FROM python:3.10.7

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
&& apt-get install -y --no-install-recommends
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY ./requirements.txt .
RUN pip install -r requirements.txt
RUN pip install git+https://github.com/Rapptz/discord.py.git#egg=discord.py
ENV PYTHONUNBUFFERED 1
COPY . /usr/src/app/