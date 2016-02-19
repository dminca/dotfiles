# Install Java 7 on Debian

```sh
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
# Java 7
apt-get install oracle-java7-installer
# For Java 8 command is:
apt-get install oracle-java8-installer
```

source: [Installing Java 7 (Oracle) in Debian via apt-get][1]

[1]: http://stackoverflow.com/a/15543636