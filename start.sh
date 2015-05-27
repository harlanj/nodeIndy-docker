#!/bin/bash

echo "Creating log directories"
mkdir -p /var/logs/socket.io
mkdir -p /var/logs/supervisor
mkdir -p /var/logs/haproxy

# Pull tutum/haproxy docker image
echo "Pulling tutum/haproxy docker image"
docker pull tutum/haproxy

# Create 4 containers with node app
echo "Creating and starting 4 node apps in docker containers"
docker run -dt -v /var/logs:logs --name socketio1 socketio
docker run -dt -v /var/logs:logs --name socketio2 socketio
docker run -dt -v /var/logs:logs --name socketio3 socketio
docker run -dt -v /var/logs:logs --name socketio4 socketio

# Create haproxy container and link all node apps in docker containers
# The -e flag overrides environment variables. It will override environment variables set by the Dockerfile also
echo "Running haproxy docker container and linking node app containers for load balancing"
docker run -de -v /var/logs:logs -p 80:80 --link socketio1:socketio1 --link socketio2:socketio2 --link socketio3:socketio3 --link socketio4:socketio4 BACKEND_PORT=8080 tutum/haproxy