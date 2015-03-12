#!/bin/bash

# Custom Git configuration.
sudo cp /vagrant/pantheon/gitconfig /home/vagrant/.gitconfig

# Install bash auto-complete support for Git.
sudo curl -s https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -L -o /etc/profile.d/git-completion.sh

# Install Terminus, latest version.
TERMINUS_LATEST=$(curl -s -D - https://github.com/pantheon-systems/cli/releases/latest -o /dev/null | grep Location | cut -d "/" -f 8)
TERMINUS_LATEST=${TERMINUS_LATEST//[^a-zA-Z0-9_.]/}
sudo curl -s https://github.com/pantheon-systems/cli/releases/download/${TERMINUS_LATEST}/terminus.phar -L -o /usr/local/bin/terminus && sudo chmod +x /usr/local/bin/terminus

# Install Displica.
sudo cp /vagrant/pantheon/displica /usr/local/bin/
sudo chmod 755 /usr/local/bin/displica

# Prepare vhost_alias.
cd /etc/apache2/mods-enabled/
sudo ln -s ../mods-available/vhost_alias.load
sudo cp /vagrant/pantheon/pantheon.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-enabled/
sudo ln -s ../sites-available/pantheon.conf

# Prepare empty .drush directory.
mkdir /home/vagrant/.drush
