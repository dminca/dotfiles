# Tar a folder and subfolders

Tar all the files in a folder and any subfolders within that folder.

```sh
tar -c --gzip -f foo.tar.gz foo/
```

This can be combined with GPG to encrypt your archive
```sh
tar zcvf - /tmp/directory | gpg -c > /tmp/directory.tar.gz.gpg
```

source: [askubuntu.com](http://askubuntu.com/questions/98443/encrypting-files-and-folder-through-terminal/98776#98776)
