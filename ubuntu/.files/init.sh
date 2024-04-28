curl -sL "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/.files/.promptrc" -o /home/${SIAB_USER}/.promptrc
#cat /home/${SIAB_USER}/.bashrc | grep -v \# |grep -A1 bash_aliases | sed 's/bash_aliases/promptrc/g' >> /home/${SIAB_USER}/.bashrc 
echo "[[ ! -f /home/${SIAB_USER}/.promptrc ]] || . /home/${SIAB_USER}/.promptrc" >> /home/${SIAB_USER}/.bashrc
mkdir -p /home/${SIAB_USER}/.ssh
curl -sL "http://10.2.72.6:42069/.secret/win-95" -o /home/${SIAB_USER}/.ssh/win-95
chown -Rh ${SIAB_USER} /home/${SIAB_USER}/.ssh
chmod 400 /home/${SIAB_USER}/.ssh/win-95
