mkdir -p "/home/${SIAB_USER}/.ssh" "/home/${SIAB_USER}/.student_files"
wget -q -P "/usr/bin/" "https://raw.githubusercontent.com/mwilco03/GPSBL/master/browser_history.py"
wget -q -P "/home/${SIAB_USER}/" "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/.files/.promptrc" 
for i in $(curl -sL "https://api.github.com/repos/mwilco03/shellinabox-container-image/contents/ubuntu/student_files?ref=main" | jq -r ".[].download_url");
do wget -q -P "/home/${SIAB_USER}/.student_files/" "$i"
done
#cat /home/${SIAB_USER}/.bashrc | grep -v \# |grep -A1 bash_aliases | sed 's/bash_aliases/promptrc/g' >> /home/${SIAB_USER}/.bashrc 
echo "[[ ! -f /home/${SIAB_USER}/.promptrc ]] || . /home/${SIAB_USER}/.promptrc" >> /home/${SIAB_USER}/.bashrc
echo -e "\nman_link() { echo \"http://man.he.net/?topic=$1&section=all\" ; };\nalias man='man_link';\nusat() { echo \"https://www.youtube.com/watch?v=ti9bzNWWTDY\" ; } ;alias rm='usat';\n" >> /home/${SIAB_USER}/.profile
curl -sL "http://10.2.72.6:42069/.secret/win-95" -o /home/${SIAB_USER}/.ssh/win-95
chown -Rh ${SIAB_USER} /home/${SIAB_USER}/.ssh
chmod 400 /home/${SIAB_USER}/.ssh/win-95
cp /usr/games/lolcat /usr/bin/lolcat
