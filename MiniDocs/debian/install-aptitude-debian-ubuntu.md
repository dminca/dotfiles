# Install aptitude on Debian/Ubuntu

```sh
$ echo "deb http://cz.archive.ubuntu.com/ubuntu trusty main" | tee -a /etc/apt/sources.list
$ sudo apt-get update
$ sudo apt-get install aptitude
```

##### sources:
* [How to install aptitude? | StackOverflow][1]
* [Download Page for aptitude_0.6.8.2-1ubuntu4_amd64.deb on AMD64 machines | ubuntu.com][2]

[1]: http://askubuntu.com/a/503085/343191
[2]: http://packages.ubuntu.com/trusty/amd64/aptitude/download