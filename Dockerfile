FROM python:3.10.6-alpine

RUN	apk --update add \
    bash \
    openssh-client \
    libffi-dev \
    build-base \
	&& rm -rf /var/cache/apk/*
RUN pip3 install pip --upgrade
RUN pip3 install ansible==7.4.0

RUN  mkdir -p /playbook
WORKDIR /playbook

RUN mkdir -p /root/.ssh
RUN echo 'StrictHostKeyChecking no' > /root/.ssh/config
RUN chmod 0600 /root/.ssh/config