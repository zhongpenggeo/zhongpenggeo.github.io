---
title: Manage data in Docker 
date: 2019-04-13 15:24:06
categories:
- Docker
---
#### Default 
all files created inside a container are stored on a writable container layer, therefor:  
- the data **doesn’t persist** when that container no longer exists, **difficult to transport data** to another process out of the container;
- can not move data when running
-  requires a storage driver to manage the filesystem

### options to store files
- **volumes** are stored in a part of the host filesystem which is managed by Docker (/var/lib/docker/volumes/ on Linux), best way to store; **Non-Docker processes should not modify** this part of the filesystem.
- **bind mounts**: Non-Docker processes on the Docker host or a Docker container can modify them at any time
- (or tmpfs in linux system) are stored in the host system’s memory only and are never written to host ystem's filesystem.  

![types of mounts and where they live on the Docker host](../../imags/types-of-mounts.png)  
### Usage 
#### Volume: 
- use `docker volume create` command; 
- When you create a volume, it is stored within a directory on the Docker host.
- When you mount the volume into a container, this directory is what is mounted into the container. This is similar to the way that bind mounts work
- `-v` or `--volume` and `--mount`
- `--mount` is easier and can use on services  

**Create and manage volumes**:  
- `docker volume create my-vol`
- `docker volume ls`
- `docker volume inspect mu-vol`

**Start a container with a volume**:  
f you start a container with a volume that does not yet exist, Docker creates the volume for you. The following example mounts the volume myvol2 into /app/ in the containe
```sh
docker run -d \
  --name devtest \
  -v myvol2:/app \
  nginx:latest
```

#### bind mounts
