#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/mescedia-ftps.pem -out /etc/ssl/private/mescedia-ftps.pem