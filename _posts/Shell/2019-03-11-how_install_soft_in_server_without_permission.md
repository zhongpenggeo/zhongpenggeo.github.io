---
title: how-install-soft-in-server-without-permission
date: 2019-03-11 15:22:44
categories:
- Shell
---
```sh
apt-get source PACKAGE
./configure --prefix=$HOME/myapps
make
make install
```

#### Point

- prefix must in the directory of you own
- PACKAGE is the source of your package.