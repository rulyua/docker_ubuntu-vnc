# Docker Ubuntu VNC

*Ruslan (rulyua@gmail.com)* 12.01.2025

**quick start**:
docker run --rm -it -p 5902:5900 rulyua/ubuntu-vnc

connect VNC client to localhost:5902


## Desktop Environments

- **xfce**
- **mate**
- **kde**
- **openbox**


### Credentials:
| User   | Password |
| ------ | -------- |
| ubuntu | m        |



## More Detail Usage
```
docker run --rm -it -p 2222:22 -p 5902:5900 \
-e XRES=1024x740x24 \
-e DE=kde \
--mount src=`pwd`,target=/host,type=bind \
--name ubuntu_vnc rulyua/ubuntu-vnc
```

XRES - Screen resolution  
DE - Desktop Environment  
--mount src=`pwd`,target=/host,type=bind` - mount docker  host current dir to container /host

**Connect to ssh:**  
ssh -p 2222 ubuntu@localhost

**Connect to running docker:**  
docker exec -it ubuntu_vnc bash

**Check supervisord inside docker:**  
supervisorctl status

## To locally build the image from the `Dockerfile` (for developers)

If you want to customize the image: 

```sh
# clone git repository
$ git clone https://github.com/rulyua/docker_ubuntu-vnc.git

# build image
$ cd docker_ubuntu-vnc
$ docker build -t rulyua/ubuntu-vnc .
```
