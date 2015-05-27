FROM ubuntu:14.04

RUN apt-get update -y && apt-get install -y curl wget git supervisor build-essential
RUN mkdir -p /var/log/supervisor /logs /opt/harlaNet
RUN cd /opt/harlaNet && git clone https://github.com/onmodulus/socketio-example.git && cd socketio-example && npm install
RUN curl https://raw.githubusercontent.com/isaacs/nave/master/nave.sh > /opt/nave.sh && bash /opt/nave.sh usemain 0.10.32

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
EXPOSE 8080
COMMAND "/usr/bin/supervisord"
