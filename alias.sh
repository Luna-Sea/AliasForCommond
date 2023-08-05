mkdir -p /etc/alias/
echo " alias     Pupdate='apt update'               " >> /etc/alias/alias.sh
echo " alias     Pupgrade='apt upgrade'             " >> /etc/alias/alias.sh
echo " alias     Premove='apt remove'               " >> /etc/alias/alias.sh
echo " alias     Pinstall='apt install'             " >> /etc/alias/alias.sh
echo " alias     Pinstalled='apt list --installed'  " >> /etc/alias/alias.sh
echo " alias     Psearch='apt search'               " >> /etc/alias/alias.sh
echo " alias     Pshow='apt show'                   " >> /etc/alias/alias.sh
echo " alias     Pclean='apt clean'                 " >> /etc/alias/alias.sh
echo " alias     pautoclean='apt autoclean'         " >> /etc/alias/alias.sh
echo " alias     Systemversion='lsb_release -a'     " >> /etc/alias/alias.sh
echo " alias     Softwareversion='update-alternatives --config'     " >> /etc/alias/alias.sh
echo " alias     Systememerg='journalctl -p 0 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemalert='journalctl -p 1 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemcritical='journalctl -p 2 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemerror='journalctl -p 3 --reverse'     " >> /etc/alias/alias.sh
echo " alias     Systemwarning='journalctl -p 0..4 --reverse'     " >> /etc/alias/alias.sh



printf "\n"                                           >> /etc/bash.bashrc
printf "source  /etc/alias/alias.sh"                  >> /etc/bash.bashrc
source /etc/bash.bashrc
