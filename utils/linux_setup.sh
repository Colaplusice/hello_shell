#!/bin/bash

chsh -s /bin/bash
sudo apt-get upgrade && apt-get install zsh git autojump

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &&
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"&&
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

## ssh commit

ssh_auth(){

read -r  -p " please enter server ssh address. example: ssh username@ip " ssh_address

pub_key_path=$(find /Users/icecola/.ssh -name *.pub -print -quit)
target_path=~/.ssh

scp "${pub_key_path}" "${ssh_address}":"${target_path}"
ssh "${ssh_address}"

cat "${target_path}/" >>

}