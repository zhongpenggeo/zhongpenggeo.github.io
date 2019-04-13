---
title: Docker run 
date: 2019-04-13 15:24:06
categories:
- Docker
---
### Genral form 
```sh
docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
```
An image developer can define image defaults related to:  
- detached or foreground running
- container identification
- network settings
- runtime constraints on CPU and memory

### Operator exclusive options
#### Detached vs foreground
- `-d` in detached mode; Detached mode: Run container in the background, print new container id. By design, containers started in detached mode exit when the root process used to run the container exits, unless you also specify the `--rm` option
- foreground is default;  

#### Container identification
 If you do not assign a container name with the` --name` option, then the daemon generates a random string name for you. Defining a `name` can be a handy way to add meaning to a container
 
#### PID equivalent

#### Image[:tag]
While not strictly a means of identifying a container, you can specify a version of an image you’d like to run the container with by adding image[:tag] to the command. For example, `docker run ubuntu:14.04`.