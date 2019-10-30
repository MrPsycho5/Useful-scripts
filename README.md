# Useful scripts
A dump of my personal scrips.

# Securessh.sh

This script chooses a random port between 49151 and 65535 (so-called dynamic ports, so the SSH won’t collide with any application) and makes SSH listen on that port. This script also completely disables password authentication, so the only option is to use SSH keys. It can also create a master key, which grants you access to all users. It is useful in private environments, but be careful with it.
Read more [here](https://mrpsycho.pl/cheatsheets/Bash-script-for-disabling-password-login/)

```
wget https://i.mrpsycho.pl/selif/securessh.sh && sudo bash securessh.sh
```

# qrn.sh

QRN stands for quick rename. The script renames a certain file to it's parent folder name. It can also take a few files at once, for example `qrn file1 file2` or `qrn *`, as well as subdirectories `qrn folder/file` or `qrn */*`, but watch out as the files from subdirectories will be moved to the folder the command is run in.

```
wget https://i.mrpsycho.pl/selif/qrn.sh && sudo mv qrn.sh /usr/local/bin/qrn && sudo chmod +x /usr/local/bin/qrn
```

