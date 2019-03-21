---
title: for if until 
date: 2019-03-21 15:53:15
categories:
- Shell
---
## Shell中的循环语句

### 1. for
```sh
for var in list
do
    command1
    command2
    ...
    commandN
done
```

### 2. if
```sh
if commands; then
commands
[elif commands; then
commands...]
[else
commands]
fi
```
or  
```sh
#!/bin/bash

if [ "$#" -gt 0 ]
then
    echo "There's Beans"
fi

if [ "$1" = "cool" ]
then
echo "Cool Beans"
fi
```

#### 2.1 file conditions
- -d file	True if the file is a directory
- -e file	True if the file exists (note that this is not particularly portable, thus -f is generally used)
- -f file	True if the provided string is a file
- -g file	True if the group id is set on a file
- -r file	True if the file is readable
- -s file	True if the file has a non-zero size
- -u	True if the user id is set on a file
- -w	True if the file is writable
- -x	True if the file is an executable
```sh
#!/bin/bash

if [ -f "$1" ]
then
    echo "$1 is a file"
else
    echo "$1 is not a file"
fi
```

### 3. until
```sh
#!/bin/sh

a=0

until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```
the output is 0 to 9.