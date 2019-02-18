#!/bin/bash


setup_zsh(){
chsh -s /bin/zsh
sudo apt-get -y update && apt-get -y install zsh git autojump
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &&
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"&&
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}
## ssh commit

ssh_auth(){
read -r  -p " please enter server ssh address. example: ssh username@ip " ssh_address

pub_key_path=$(find ~/.ssh -name *.pub -print -quit)
target_path=~/.ssh
file_name=$(echo "$pub_key_path" |rev |cut -d '/' -f 1 |rev)

scp "${pub_key_path}" "${ssh_address}":"${target_path}"
ssh "${ssh_address}"
cat "${target_path}/${file_name}" >> "${target_path}/authorized_keys"
}


main(){
ssh_auth
setup_zsh
}

case $1 in
    setup_zsh) setup_zsh
    ;;
    2|3) echo 2 or 3
    ;;
    *) echo 'usage  ./linux_setup.sh'
    ;;
esac

