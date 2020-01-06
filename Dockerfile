FROM ubuntu:latest

#ADD sources.list /etc/apt/sources.list

RUN apt-get update \
  && apt-get install sudo curl vim libssl1.0.0 nodejs npm -y \
  && curl -s https://fibos.io/download/installer.sh | sh \
  && npm config set registry https://registry.npm.taobao.org \
  && npm install n -g -y \
  && n stable

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get purge -y g++ \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/* \
    && rm -rf /tmp/*

#CMD fibos scripts/deploy.js && fibos start_fibos/node.js && npm run dev
