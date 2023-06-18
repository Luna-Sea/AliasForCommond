echo " alias     Pupdate='apt update'" >> /etc/alias/alias.sh
echo " alias     Pupgrade='apt upgrade'>> /etc/alias/alias.sh
echo " alias     Premove='apt remove'>> /etc/alias/alias.sh
echo " alias     Pinstall='apt install'>> /etc/alias/alias.sh
echo " alias     Pinstalled='apt list --installed'>> /etc/alias/alias.sh
echo " alias     Psearch='apt search'>> /etc/alias/alias.sh
echo " alias     Pshow='apt show'>> /etc/alias/alias.sh
echo " alias     Pclean='apt clean'>> /etc/alias/alias.sh
echo " alias     Pautoclean='apt autoclean'>> /etc/alias/alias.sh
echo " alias     Systemversion="lsb_release -a">> /etc/alias/alias.sh



printf "\n" >> /etc/bash.bashrc
printf "source  /etc/alias/alias.sh"
source /etc/bash.bashrc
