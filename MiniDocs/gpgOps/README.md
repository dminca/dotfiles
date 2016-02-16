PGP encryption guide
====================


Generating your key pair
------------------------

> `gpg --gen-key`

> `echo "export GPGKEY=01086FDA" > ~/.bashrc`

> `source ~/.bashrc`

and its associated revocation certificate in case you lose control of your private key

> `gpg --output revoke.asc --gen-revoke $GPGKEY`


Make it available to others
---------------------------

Generate an ASCII armored version of your public key too, so you can share it with others nicely

> `gpg --output cristian-rasch.asc --export -a $GPGKEY`

and don't forget to upload your public key to a key server, so that others can find it to send you encrypted messages

> `gpg --send-keys --keyserver keys.gnupg.net  $GPGKEY`


Playing well with others
------------------------

### Minimum theory on PGP ids and key fingerprints ###

Key fingerprints are globally unique

`gpg --fingerprint $GPGKEY`


`pub   4096R/01086FDA 2014-10-28 [expires: 2019-10-27]`

`Key fingerprint = 1D99 6DE7 D971 F91A BA52  C2FE F37D 32B2 0108 6FDA`

`uid Cristian Rasch <cristianrasch@example.com>`

`sub 4096R/027408A9 2014-10-28 [expires: 2019-10-27]`


Your PGP id are just the last 8 characters of the fingerprint, e.g. 01086FDA


Retrieve someone else's key from a keyserver
--------------------------------------------

`gpg --keyserver keys.gnupg.net --recv-keys 01086FDA`

double check the key's fingerprint

`gpg --fingerprint 01086FDA`

When you are sure about the authenticity of the key you can import it

`gpg --import cristian-rasch.asc`


Encryption for the masses
-------------------------

Encrypt a message

`gpg -r AD42EC69 -e ~/Desktop/greeting.txt`

(AD42EC69 is the PGP id you want to send an encrypted message to)

Similarly, you can easily decrypt a message sent to you

`gpg -d ~/Desktop/greeting.txt`

Key signing
-----------

Sign a key

`gpg --sign-key AD42EC69`

and export it so you can send back the signed key

`gpg --armor --export AD42EC69 > AD42EC69.signed-by.01086FDA.asc`

or upload it to the appropriate key server

`gpg --send-keys --keyserver keys.gnupg.net AD42EC69`

Once you receive your signed key you may as well import it

`gpg --import 01086FDA.signed-by.AD42EC69.asc`

take pride in your key signatures

`gpg --list-sigs 01086FDA`

and finally upload 'em to the server

`gpg --keyserver keys.gnupg.net --send-keys 01086FDA`


Backups
-------

Backup your public key

`gpg -ao public.key --export $GPGKEY`

and don't forget to backup your private key as well

`gpg --list-secret-keys`

your private key ID starts after something like

sec   4096R/**01086FDA** 2014-10-28 [expires: 2019-10-27]

then all you need to do is issue the following command

`gpg -ao private.key --export-secret-keys 01086FDA`

Restoring your key pair is easy as pie

`gpg --import public.key`

`gpg --import private.key`


Source
------

Most of the inpiration for putting this guide together was drawn from the [Ubuntu GnuPrivacyGuardHowto](https://help.ubuntu.com/community/GnuPrivacyGuardHowto)

