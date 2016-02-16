# Extract all kinds of archives with `dtrx`

dtrx intelligently extracts many different archive types. It will get the contents from tar, zip, rpm, deb, and cpio archives, as well as compressed files, with one simple command. It helps keep your filesystem sane by putting every archive's contents into a dedicated directory, and making sure the owner can read and write whatever's extracted. It can even recursively extract archives.

```sh
dtrx file.zip
dtrx file.tar.gz
dtrx file.7z
```
