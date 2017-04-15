#!/bin/bash
wget https://s3.amazonaws.com/BUCKET/userkeys.sh -O /usr/local/bin/userkeys.sh
chmod 555 /usr/local/bin/userkeys.sh

echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config
echo "AuthorizedKeysCommand /usr/local/bin/userkeys.sh" >> /etc/ssh/sshd_config 
echo "AuthorizedKeysCommandUser nobody" >> /etc/ssh/sshd_config 

service ssh || sshd restart
