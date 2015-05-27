FROM ubuntu:14.04

RUN apt-get update -y && apt-get install -y curl wget git supervisor build-essential && \
mkdir -p /var/log/supervisor && mkdir -p /logs && mkdir -p /opt/harlaNet && \
cd /opt/harlaNet && git clone https://github.com/onmodulus/socketio-example.git && \
cd /opt && curl https://raw.githubusercontent.com/isaacs/nave/master/nave.sh > /opt/nave.sh && bash /opt/nave.sh usemain 0.10.32 && \
cd /opt/harlaNet/socketio-example && npm install

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
EXPOSE 8080
CMD "/usr/bin/supervisord"
