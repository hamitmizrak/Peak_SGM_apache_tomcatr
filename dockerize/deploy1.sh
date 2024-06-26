#!/bin/bash

# Sadece Dockerfile varsa
# docker build -t my_tomcat2 .
# docker container run -d --name tomcat_container -p 1111:8080  my_tomcat2

# Eğer docker-compose
docker-compose up -d