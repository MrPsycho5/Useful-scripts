# Useful scripts
A dump of my personal scrips.

# Securessh.sh

This script chooses a random port between 49151 and 65535 (so-called dynamic ports, so the SSH won’t collide with any application) and makes SSH listen on that port. This script also completely disables password authentication, so the only option is to use SSH keys. It can also create a master key, which grants you access to all users. It is useful in private environments, but be careful with it.
Read more [here](https://mrpsycho.pl/cheatsheets/Bash-script-for-disabling-password-login/)

```
wget https://i.mrpsycho.pl/selif/securessh.sh && bash securessh.sh
```
