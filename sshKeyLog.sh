#!/bin/bash
# ANSI color codes
RED='\033[0;31m'
NC='\033[0m' # No Color

mkdir -p ~/.ssh
cat ./id_rsa.pub >> ~/.ssh/authorized_keys

ssh_config_file="/etc/ssh/sshd_config"
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' $ssh_config_file

echo -e "${RED}Do you want to disable password authentication? | yes or no${NC}"
read -r answer
if [ "$answer" == "yes" ]; then
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' $ssh_config_file
    systemctl restart ssh
    echo -e "${RED}SSH configuration updated. Public key authentication enabled, password authentication disabled.${NC}"
else
    systemctl restart ssh
    echo -e "${RED}SSH configuration updated. Public key authentication enabled, password authentication enabled.${NC}"
fi
rm ~/id_rsa.pub
