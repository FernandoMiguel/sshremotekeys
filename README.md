# SSH with Remote Keys storage

With my sysadmin background, being as lazy as possible, I always try to have the lowest overhead maintenance possible over systems.
Securely maintain ssh keys to access servers is a tricky business. Keys have to be rotated regularly, individuals join/leave projects/companies, ssh key passwords are forgotten, etc.

Typically, admins add ssh keys to ~/.ssh/authorized_keys or %h/.ssh/authorized_keys, others LDAP.
Updating these is a nightmare, even with packaging tools like ansile or puppet.
Some have crons to update these, but that can create a delay, and we all know what happens when you add delays.

Instead, I've opted to move away from managing keys in the instances, and move them to a centrally controlled location, where it is easy to update objects/permissions and have the instances check back on login attempt.

## Installation

[sshauth-install.sh](sshauth-install.sh) needs to be run in the instance.
You will need to modify "https://s3.amazonaws.com/BUCKET/userkeys.sh" to use your server personalised version.
The script will modify ssh_config, pull your custom [userkeys-github.sh](userkeys-github.sh)  or [userkeys-s3.sh](userkeys-s3.sh), and restart sshd.

## Usage

TODO: Write usage instructions

## Gotchas

TODO: Write usage instructions

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

TODO: Write license
0
