#!/bin/sh

# Install Terminus 0.5.1.
sudo curl -s https://github.com/pantheon-systems/cli/releases/download/0.5.1/terminus.phar -L -o /usr/local/bin/terminus && sudo chmod +x /usr/local/bin/terminus

# Install Displica.
cp displica /usr/local/bin/
chmod 755 /usr/local/bin/displica

# Prepare vhost_alias.
cd /etc/apache2/mods-enabled/
sudo ln -s ../mods-available/vhost_alias.load
sudo cp pantheon.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-enabled/
sudo ln -s ../sites-available/pantheon.conf
