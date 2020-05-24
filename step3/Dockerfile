# A Dockerfile for our reverse proxy
FROM php:7.2-apache

RUN apt-get update -y && apt-get install -y vim

COPY conf/ /etc/apache2

RUN a2enmod proxy proxy_http && service apache2 restart

RUN a2ensite 000-* 001-*
