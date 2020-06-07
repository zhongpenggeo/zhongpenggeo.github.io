---
title: similar command 
date: 2019-04-13 20:29:25
categories:
- Docker
---
**notice**: all command need a parent command `docker` in the front.
#### kill and stop
- kill: send SIGKILL; stop main entrypoitn process **abruptly**.
- stop: send SIGTERM, and then SIGKILL after grace period; try to stop it gracefully

#### run vs start
- start: stars a exist container( start a stopped container)
- run : run an image as new container;

### Other key command
- build: build an image from a dockerfile(new a image manually?)
- cp: copy files/folders between a container and local filesystem
- create: create a new container
- history: show the history of an image
- image: manage image, includes many child command
- images: list images
- search: search the docker hub for images
- 