#!/bin/bash
# download to the host your custom userkeys.sh
wget https://s3.amazonaws.com/BUCKET/userkeys.sh -O /usr/local/bin/userkeys.sh

# set file permissions
chmod 555 /usr/local/bin/userkeys.sh

# modifies sshd_config with the following settings:
# enables publickey login
echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config
# configures AuthorizedKeysCommand to execute userkeys.sh on each login
echo "AuthorizedKeysCommand /usr/local/bin/userkeys.sh" >> /etc/ssh/sshd_config 
# sets the user to nobody to avoid escalation privilege
echo "AuthorizedKeysCommandUser nobody" >> /etc/ssh/sshd_config 

# restart ssh or sshd depending of the distro
service ssh || sshd restart
