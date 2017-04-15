# SSH with Remote Keys storage

With my sysadmin background, being as lazy as possible, I always try to have the lowest overhead maintenance possible over systems.

Securely maintain ssh keys to access servers is a tricky business. Keys have to be rotated regularly, individuals join/leave projects/companies, ssh key passwords are forgotten, etc.
#

Typically, admins add ssh keys to ~/.ssh/authorized_keys or %h/.ssh/authorized_keys, others LDAP.

Updating these is a nightmare, even with packaging tools like ansile or puppet.

Some have crons to update these, but that can create a delay, and we all know what happens when you add delays.
#

Instead, I've opted to move away from managing keys in the instances, and move them to a centrally controlled location, where it is easy to update objects/permissions and have the instances check back on login attempt.

## Installation

[sshauth-install.sh](sshauth-install.sh) needs to be run in the instance.

You will need to modify [https://s3.amazonaws.com/BUCKET/userkeys.sh] to use your server personalised version.

The script will modify ssh_config, pull your custom [userkeys-github.sh](userkeys-github.sh)  or [userkeys-s3.sh](userkeys-s3.sh), and restart sshd.

## Usage

SSH AuthorizedKeysCommand was introduced in [2013's OpenSSH 6.1](https://www.openssh.com/txt/release-6.2), although you will only find is commonly around in OpenSSH 6.9 distro packages.

From the manual:
> sshd(8): Added a sshd_config(5) option AuthorizedKeysCommand to support fetching authorized_keys from a command in addition to (or instead of) from the filesystem. The command is run under an account specified by an AuthorizedKeysCommandUser sshd_config(5) option.

This allows us to execute an arbitary command when a login attemp it made via ssh. 
In the case of this setup, it executes userkeys.sh 

Depending 

## Gotchas

TODO: ed25519
TODO: fail2ban
TODO: API rate limit

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

[MIT](LICENSE)

