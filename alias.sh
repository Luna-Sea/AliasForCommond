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
#  变量$target_dir代表目标文件夹的路径
target_path="$target_dir/environment.sh"

# 检查目标文件所在目录是否存在，不存在则创建
target_dir=$(dirname "$target_path")
mkdir -p "$target_dir"

# 主脚本内容
main_script_content=$(cat <<EOF
#!/bin/bash

set -e

# 如果参数个数不等于1，就输出使用说明并退出。
if [ "\$#" -ne 1 ]; then
    echo "Usage: \$0 <path_to_link>"
    exit 1
fi

# 将第一个参数（要链接的路径）保存在path_to_link变量中。
path_to_link="\$1"

# 如果指定的路径不存在，输出错误信息并退出。
if [ ! -e "\$path_to_link" ]; then
    echo "Error: Path does not exist: \$path_to_link"
    exit 1
fi

# 提取要链接的文件名
link_name=\$(basename "\$path_to_link")

# 构建链接路径
link_path="/usr/local/bin/\$link_name"

# 创建符号链接
if ln -s "\$path_to_link" "\$link_path"; then
    echo "Symbolic link created successfully: \$link_path"
else
    echo "Error creating symbolic link"
    exit 1
fi
EOF
)

# 将主脚本内容写入目标文件
echo "$main_script_content" > "$target_path"

# 检查是否写入成功
if [ $? -eq 0 ]; then
    echo "Script generated successfully at: $target_path"
else
    echo "Error generating script"
    exit 1
fi

# 添加执行权限
chmod +x "$target_path"

# 检查是否添加执行权限成功
if [ $? -eq 0 ]; then
    echo "Execution permission added successfully to: $target_path"
else
    echo "Error adding execution permission"
    exit 1
fi

# 创建符号链接. 创建environment环境变量 连接到之前创建的environment.sh
link_path="/usr/local/bin/environment"
if [ -e "$link_path" ]; then
    echo "Symbolic link already exists: $link_path"
else
    ln -s "$target_path" "$link_path"
    echo "Symbolic link created successfully: $link_path"
fi
###############



printf "\n"                                           >> /etc/bash.bashrc
printf "source  /etc/alias/alias.sh"                  >> /etc/bash.bashrc
source /etc/bash.bashrc
