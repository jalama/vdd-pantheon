# Vagrant Drupal Development for Pantheon

This project is based on the original [VDD](https://www.drupal.org/project/vdd) and all the changes in their stable branch will be pulled into this repository. However, we have made (and are still making) additions and changes so to resemble the Pantheon stack as much as possible. 

## Currently implemented changes

1. **VirtualBox shared directories are disabled**: they are buggy and slow, so we prefer to rely on SSHFS.
2. **[Terminus CLI](https://github.com/pantheon-systems/cli)** is installed by default;
3. **Displica**: a deployment script to deploy Drupal Pantheon sites locally is provided.

## Changes we'd like to implement

1. Repleace Apache with nginx;
2. More to come: please [open an issue](https://github.com/artetecha/vdd-pantheon/issues) for suggestions.

## Get started

Setup instructions are on the Wiki here on Github. [Check it out](https://github.com/artetecha/vdd-pantheon/wiki).
