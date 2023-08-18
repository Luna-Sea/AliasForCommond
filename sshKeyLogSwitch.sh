#!/bin/bash
# ANSI color codes
RED='\033[0;31m'
NC='\033[0m' # No Color

ssh_config_file="/etc/ssh/sshd_config"
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' $ssh_config_file
service ssh restart
echo "SSH configuration updated. Public key authentication enabled, password authentication disabled."

echo -e "${RED}Do you want to disable password authentication? | yes or no${NC}"
read -r answer
if [ "$answer" == "yes" ]; then
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' $ssh_config_file
    service ssh restart
    echo -e "${RED}SSH configuration updated. Public key authentication enabled, password authentication disabled.${NC}"
else
    service ssh restart
    echo -e "${RED}SSH configuration updated. Public key authentication enabled, password authentication enabled.${NC}"
fi
