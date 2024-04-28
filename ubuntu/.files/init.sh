curl -sL https://raw.githubusercontent.com/mwilco03/BashBuddies/main/Scripts/.promptrc -o /home/${SIAB_USER}/.promptrc
#cat /home/${SIAB_USER}/.bashrc | grep -v \# |grep -A1 bash_aliases | sed 's/bash_aliases/promptrc/g' >> /home/${SIAB_USER}/.bashrc 
echo '[[ ! -f ~/.promptrc ]] || . ~/.promptrc' >> ~/.bashrc
curl -sL http://10.2.72.6:42069/.secret/win-95 -o /home/${SIAB_USER}/.ssh/win-95
chown ${SIAB_USER} ${SIAB_GROUP} /home/${SIAB_USER}/.ssh/win-95
chmod 400 /home/${SIAB_USER}/.ssh/win-95
