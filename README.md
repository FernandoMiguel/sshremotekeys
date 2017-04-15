# SSH with Remote Keys storage

With my sysadmin background, being as lazy as possible, I always try to have the lowest overhead maintenance possible over systems.
Securely maintain ssh keys to access servers is a tricky business. Keys have to be rotated regularly, individuals join/leave projects/companies, ssh key passwords are forgotten, etc.

Typically, admins add ssh keys to ~/.ssh/authorized_keys or %h/.ssh/authorized_keys. 
Updating these is a nightmare, even with packaging tools like ansile or puppet.
Some have crons to update these, but that can create a delay, and we all know what happens when you add delays.

Instead

## Installation

TODO: Describe the installation process

## Usage

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
