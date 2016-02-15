# Transfer files remotely via `scp`

An important function of SSH that allows secure file transfer using SCP and SFTP. `scp` stands for `Secure Copy`.

To copy a file from B to A while logged into B:
```sh
scp /path/to/file username@a:/path/to/destination
```

To copy a file from B to A while logged into A:
```sh
scp username@b:/path/to/file /path/to/destination
```

### Examples:
```sh
scp myusername@university_computer:/home/myusername/file.odt /local/destination/path/
```

```sh
scp -vr dminca@192.168.1.2:/home/dminca/env/* /home/daniel/
```

source: [askubuntu.com](http://askubuntu.com/questions/329370/using-scp-to-copy-files-from-remote-to-home-machine/329372#329372)
