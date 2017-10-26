php7-node-alpine
================

This Dockerfile provides a base image for with PHP 7.1, NodeJS on Alpine Linux

Tags currently available:

* `latest` or `8.8.0` - PHP 7.1 NodeJS 8.8.0, on Alpine Linux
* `8.7.0` - PHP 7.1 NodeJS 8.7.0, on Alpine Linux
* `6.11.5` - PHP 7.1 NodeJS 6.11.5, on Alpine Linux

# Arguments

The Docker image can be built with different arguments:

- `NODE_VERSION`, defaults to 8.8.0

# How to use

```
docker build -t my-jenkins-runner php7-node-alpine:latest node -v
```
