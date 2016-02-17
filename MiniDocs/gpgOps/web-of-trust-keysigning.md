# Keysigning - building a Web of Trust
## TL;DR keysigning
- [Creating the perfect GPG Keypair][2]
- [Debian - keysigning][3]
- [Further reading on OpenPGP][4]
```bash
# use RSA 4096 for better security
$ gpg --gen-key

# fetch key to sign it
$ gpg --keyserver keyring.debian.org --recv-keys 0xDEADBEEF

# sign key
$ gpg --edit-key 0xDEADBEEF

# verify signed key
$ gpg --list-sigs 0xDEADBEEF

# all good, send key
$ gpg --export -a 0xDEADBEEF > someguys.key

# key is signed by others also, add it to Debian keyring
$ gpg --import --import-options merge-only mysigned.key
$ gpg --keyserver keyring.debian.org --send-keys <your key id>

```

----
## Introduction
> Since a lot of developers meet at trade shows or conferences they have become a nice way to get other people sign ones GnuPG key and improve the web of trust. 

>Especially for people who are new to the project, keysigning and meeting other developers has been very interesting.

People should only sign a key under at least 2 conditions:

1. The key owner convinces the signer that the identity in the UID is indeed their own identity by whatever evidence the signer is willing to accept as convincing. Usually this means the key owner must present a government issued ID with a picture and information that match up with the key owner.
> Some signers know that government issued ID's are easily forged and that the trustability of the issuing authorities is often suspect and so they may require additional and/or alternative evidence of identity
2. The key owner verifies that the fingerprint and the length of the key about to be signed is indeed their own.

## What you **need** at conferences/meetups
- printed out GnuPG fingerprints, key lengths and an identity card to prove your identity (passport, drivers license or similar)
- fingerprints and [key lengths][1] are given to other people who ought to sign your key after the meeting
- If you don't have a GnuPG key yet, create one with `gpg --gen-key`
- Only sign a key if the identity of the person whose key to sign is proven
- After the meeting you'll have to fetch the GnuPG key in order to sign it. The following may help:
  > `gpg --keyserver keyring.debian.org --recv-keys 0xDEADBEEF`
  - To sign the key, enter the edit menu with
  > `gpg --edit-key 0xDEADBEEF
  - In GnuPG select all uids to sign with `uid n`, where `n` is the number of the uid shown in the menu. You can also press enter to sign all the uids
  - To sign a key, enter `sign`. You will then be shown the fingerprint and length of they key which you have to compare with the one you've got from the person you met
  - When asked for the level of certification, choose `"casual"`
  - Quit GnuPG with `quit`
  - To verify you have signed the key correctly, you can do:
  > `gpg --list-sigs 0xDEADBEEF`
  - Once everything looks good, you can send the signed key to its recipient by doing
  > `gpg --export -a 0xDEADBEEF > someguys.key`
  - If someone signs your key in this manner, you can add it to the Debian keyring by doing:
```bash
$ gpg --import --import-options merge-only mysigned.key
$ gpg --keyserver keyring.debian.org --send-keys <your key id>
```
  
This document is sourced from [Debian - Keysigning][3]

[1]: https://www.gnupg.org/faq/gnupg-faq.html#define_elgamal
[2]: https://alexcabal.com/creating-the-perfect-gpg-keypair/
[3]: http://www.debian.org/events/keysigning
[4]: https://tails.boum.org/doc/get/trusting_tails_signing_key/index.en.html#index5h1