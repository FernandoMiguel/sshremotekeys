#!/bin/sh

set -e

#############################################################################
# please modify to use your own file
#############################################################################
uri="https://raw.githubusercontent.com/FernandoMiguel/sshremotekeys/gitfm/userkeys.sh"

# download to the host your custom userkeys.sh
wget $uri -O /usr/local/bin/userkeys.sh

# set file permissions
chmod 555 /usr/local/bin/userkeys.sh


#############################################################################
# modifies sshd_config with the following settings:
#############################################################################

# enables publickey login
sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config

# configures AuthorizedKeysCommand to execute userkeys.sh on each login
echo "AuthorizedKeysCommand /usr/local/bin/userkeys.sh" >> /etc/ssh/sshd_config

# sets the user to root in order to save the cache key files in users home
echo "AuthorizedKeysCommandUser root" >> /etc/ssh/sshd_config

# sets the cache key file name
sed -i 's/^AuthorizedKeysFile.*/AuthorizedKeysFile .ssh\/authorized_keys .ssh\/authorized_keys_cache/' /etc/ssh/sshd_config

# make sure ~/.ssh exists
mkdir /root/.ssh

# restart ssh or sshd depending of the distro
service ssh restart ; service sshd restart
