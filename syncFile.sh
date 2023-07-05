echo "remote pc ip"
read -r ip
echo "remote account name"
read -r account
echo "ssh password or key file path"
read -r password
echo "remote file path"
read -r remote
echo "local file path"
read -r local

tee -a << EOF >> "/etc/crontab"
0 8 * * * root rsync -avz -e "ssh -i ${password}" ${account}@${ip}:${remote} ${local}
EOF

