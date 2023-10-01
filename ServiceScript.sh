echo "set service name"
read name
mkdir -p "/etc/${name}"
echo "set service run file path"
read -r file
echo "set service config para"
read -r para
echo "set service config file name"
read -r config
touch "/etc/${name}/${config}"


cat << EOF > "/etc/systemd/system/${name}.service"

[Unit]
Description=${name}
After=network.target

[Service]
ExecStart=${file}  ${para}  /etc/${name}/${config}
Restart=always

[Install]
WantedBy=default.target

EOF
