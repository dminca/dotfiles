# Secure Delete a file
> srm  is  designed  to  delete  data  on mediums in a secure manner which can not be recovered by thieves, law
enforcement or other threats.  The wipe algorythm is based on the paper "Secure Deletion of  Data  from  Mag‐
netic  and  Solid-State  Memory"  presented at the 6th Usenix Security Symposium by Peter Gutmann, one of the
leading civilian cryptographers.

### For only 1 pass of random data (less secure)
```sh
$ srm -rfll pathname
```

### For higher-security
```sh
$ srm -rf pathname
```

#### Flags explained
* The first `-r` is for *recursive mode*, it deletes all subdirectories
* the first `-l` is used for *lessening the security by writing only two passes*: one mode with 0xff and a final mode random values
* the 2nd `-l` lessons the security even more: only one random pass is written

> source: http://askubuntu.com/a/122562/343191
> More info can also be found on srm manpage. There you can also find documentation for `sfill`, `sswap` and `sdmem`
