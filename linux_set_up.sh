#!/bin/bash
# ssh免密码登录

# scp ~/.ssh/id_rsa.pub root@206.189.81.45:
# spawn ssh root@206.188.81.45
# expect "password"
# send "MyPassword\r"
# interacts
# cat ~/id_rsa.pub >>  ~/.ssh/authorized_keys
# service sshd restart


# 配置shell
sudo apt-get update && apt -y install zsh git autojump mysqlclient
chsh -s /bin/zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo apt install autojump
# auto suggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


#


