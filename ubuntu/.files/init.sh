mkdir -p "/home/${SIAB_USER}/.ssh" "/home/${SIAB_USER}/.student_files" "/home/${SIAB_USER}/scripts"
wget -q -P "/usr/bin/" "https://raw.githubusercontent.com/mwilco03/GPSBL/master/browser_history.py"
wget -q -P "/home/${SIAB_USER}/" "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/.files/.promptrc" 
wget -q -P "/home/${SIAB_USER}/" "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/.files/.saferc" 
for i in $(curl -sL "https://api.github.com/repos/mwilco03/shellinabox-container-image/contents/ubuntu/student_files?ref=main" | jq -r ".[].download_url");
do wget -q -P "/home/${SIAB_USER}/.student_files/" "$i"
done
for i in $(curl -sL "https://api.github.com/repos/mwilco03/BashBuddies/contents/Scripts?ref=main" | jq -r ".[].download_url");
do wget -q -P "/home/${SIAB_USER}/scripts/" "$i"
done
find "/home/${SIAB_USER}/scripts/" -type f -exec chmod +x {} \;
#cat /home/${SIAB_USER}/.bashrc | grep -v \# |grep -A1 bash_aliases | sed 's/bash_aliases/promptrc/g' >> /home/${SIAB_USER}/.bashrc 
echo "[[ ! -f /home/${SIAB_USER}/.promptrc ]] || . /home/${SIAB_USER}/.promptrc" >> /home/${SIAB_USER}/.bashrc
echo "[[ ! -f /home/${SIAB_USER}/.saferc ]] || . /home/${SIAB_USER}/.saferc" >> /home/${SIAB_USER}/.bashrc
curl -sL "http://10.2.72.6:42069/.secret/win-95" -o /home/${SIAB_USER}/.ssh/win-95
chown -Rh ${SIAB_USER} /home/${SIAB_USER}/
chmod 400 /home/${SIAB_USER}/.ssh/win-95
cp /usr/games/lolcat /usr/bin/lolcat
 
