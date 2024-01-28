#!/bin/bash
mkdir -p /etc/alias/
echo " alias     Pupdate='apt update'               " >> /etc/alias/alias.sh
echo " alias     Pupgrade='apt upgrade'             " >> /etc/alias/alias.sh
echo " alias     Premove='apt remove'               " >> /etc/alias/alias.sh
echo " alias     Pinstall='apt install'             " >> /etc/alias/alias.sh
echo " alias     Pinstalled='apt list --installed'  " >> /etc/alias/alias.sh
echo " alias     Psearch='apt search'               " >> /etc/alias/alias.sh
echo " alias     Pshow='apt show'                   " >> /etc/alias/alias.sh
echo " alias     Pclean='apt clean'                 " >> /etc/alias/alias.sh
echo " alias     Pautoclean='apt autoclean'         " >> /etc/alias/alias.sh

echo " alias     Systemversion='lsb_release -a'     " >> /etc/alias/alias.sh
echo " alias     Softwareversion='update-alternatives --config'     " >> /etc/alias/alias.sh

echo " alias     Systemtime='dpkg-reconfigure tzdata'     " >> /etc/alias/alias.sh


echo " alias     ipv6='ip addr | grep  inet6'     " >> /etc/alias/alias.sh
echo " alias     ipv4='ip addr | grep  inet'     " >> /etc/alias/alias.sh
echo " alias     port='ss -tulpn | grep  '     " >> /etc/alias/alias.sh
echo " alias     dns='cat  /etc/resolv.conf '     " >> /etc/alias/alias.sh

echo " alias     Link='ln -s  '     " >> /etc/alias/alias.sh

echo " alias     Systememerg='journalctl -p 0 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemalert='journalctl -p 1 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemcritical='journalctl -p 2 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemerror='journalctl -p 3 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemwarning='journalctl -p 0..4 --reverse'     " >> /etc/alias/alias.sh
echo " alias     SystemcleanInfo='journalctl --vacuum-time=1months'     " >> /etc/alias/alias.sh
echo " alias     SystemcleanInfoAll='journalctl --vacuum-size=0'     " >> /etc/alias/alias.sh


echo " alias     status='cat /var/log/syslog | grep '    " >> /etc/alias/alias.sh
echo " alias     process='ps aux | grep '    " >> /etc/alias/alias.sh


###################################
content=$(cat <<EOF
#!/bin/bash

# 检查参数是否为空
if [ -z "\$1" ]; then
  echo "请提供一个路径作为参数。"
  exit 1
fi

target_file="\$1"
bashrc_file="\$HOME/.bashrc"

# 检查目标文件是否存在
if [ ! -e "\$target_file" ]; then
  echo "目标文件 '\$target_file' 不存在。"
  exit 1
fi

# 为目标文件添加执行权限
chmod +x "\$target_file"

# 检查目标文件是否已经在.bashrc中
if grep -q "\$target_file" "\$bashrc_file"; then
  echo "目标文件 '\$target_file' 已经存在于 \$bashrc_file 中。"
  exit 1
fi

# 将目标文件追加到.bashrc中
echo "export PATH=\$PATH:\$target_file" >> "\$bashrc_file"

echo "目标文件 '\$target_file' 已成功添加到 \$bashrc_file 中，并已添加执行权限。"
EOF
)

mkdir -p /etc/environment_tool

# 将脚本内容写入文件
echo "$content" > /etc/environment_tool/add_environment.sh

# 添加执行权限
chmod +x /etc/environment_tool/add_environment.sh

# 创建符号链接到/usr/local/bin,并覆盖
ln -sf /etc/environment_tool/add_environment.sh /usr/local/bin/add_environment
###############



printf "\n"                                           >> /etc/bash.bashrc
printf "source  /etc/alias/alias.sh"                  >> /etc/bash.bashrc
source /etc/bash.bashrc
