#!/bin/bash

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

# Install bash auto-complete support for Git.
cd /tmp && wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash && sudo cp git-completion.bash /etc/profile.d/git-completion.sh

# Install fancy bash prompt, colourful and with Git status support.
(cd /tmp && git clone --depth 1 https://github.com/twolfson/sexy-bash-prompt && cd sexy-bash-prompt && make install) && source ~/.bashrc

# Configure Git aliases.
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.logtree "log --graph --oneline --decorate --all"

# Get colourful git output (diff, etc)
git config --global color.ui auto
