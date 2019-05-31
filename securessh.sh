#!/bin/bash
CONF_FILE=/etc/ssh/sshd_config
x=$(($RANDOM+49151))
while [ $x -gt 65535 ]
do
  x=$(( $RANDOM+49151 ))
done

sed -i "/Port/c\Port $x" $CONF_FILE
sed -i '/ChallengeResponseAuthentication/c\ChallengeResponseAuthentication no' $CONF_FILE
sed -i '/PasswordAuthentication/c\PasswordAuthentication no' $CONF_FILE
sed -i '/UsePAM/c\UsePAM no' $CONF_FILE
sed -i '/PermitRootLogin/c\PermitRootLogin without-password' $CONF_FILE
sed -i '/PubkeyAuthentication/c\PubkeyAuthentication yes' $CONF_FILE

read -p "Enter your public SSH key: " pub_key

hashes="########################################"
ssh_num="Your randomized SSH port number is: $x"
use_all_yes="Keyless login disbaled. You can use the provided key to login as anyone."
use_all_no="Keyless login disabled. The provided key will only be used by the current user.\nYou can add more SSH keys for appropriate user in the ~/.ssh/authorized_keys file.\n"

while true; do
    read -p "Do you want to use this SSH key for all users (master key)? [y/n]: " yn
    case $yn in
        [Yy]* ) sed -i '/AuthorizedKeysFile/c\AuthorizedKeysFile %h/.ssh/authorized_keys /etc/master_key' /etc/ssh/sshd_config && echo $pub_key >> /etc/master_key && chmod 444 /etc/master_key && echo $hashes && echo $ssh_num && echo $hashes && echo $use_all_yes; break;;
        [Nn]* ) if [ ! -d "$HOME/.ssh" ]
                then
                  mkdir $HOME/.ssh
                fi
                echo $pub_key >> ~/.ssh/authorized_keys && echo $ssh_num && printf "$use_all_no"; break;;
        * ) echo "Please answer yes or no. [y/n]: ";;
    esac
done

while true; do
    read -p "Do you want to reload the SSH config? [y/n]: " yn
    case $yn in
        [Yy]* ) service ssh reload; exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
