#!/bin/bash

openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
     -keyout tls.key -out tls.crt \
     -subj "/CN=youtube.com" \
     -addext "subjectAltName=DNS:youtube.com,DNS:www.youtube.com"
