Simple docker/apache-php image
==============================

Simple Apache2/PHP image based on ubuntu:trusty

This image must be used under a NGINX proxy.

You must import the /app directory from the host.

`docker run --name www -v /srv/www/app:/app -d loobaz/apache-php`

Image available on DockerHub: https://registry.hub.docker.com/u/loobaz/apache-php/
