mkdir -p /home/${SIAB_USER}/.ssh /home/${SIAB_USER}/.student_files
wget -P /home/${SIAB_USER}/ "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/.files/.promptrc" 
for i in $(curl -sL "https://api.github.com/repos/mwilco03/shellinabox-container-image/contents/ubuntu/student_files?ref=main" | jq -r ".[].download_url");
do wget -P /home/${SIAB_USER}/.student_files/ "$i"
done
#cat /home/${SIAB_USER}/.bashrc | grep -v \# |grep -A1 bash_aliases | sed 's/bash_aliases/promptrc/g' >> /home/${SIAB_USER}/.bashrc 
echo "[[ ! -f /home/${SIAB_USER}/.promptrc ]] || . /home/${SIAB_USER}/.promptrc" >> /home/${SIAB_USER}/.bashrc
echo "man_link() { echo "\"http://man.he.net/?topic=$1&section=all\"" ; } ; \n alias man='man_link' \n" >> ~/.bashrc
echo -e "usat() { echo \"https://www.youtube.com/watch?v=ti9bzNWWTDY\" ;  } ; \n alias '--no-preserve-root /'='usat' \n" >> ~/.bashrc 
echo -e "usat() { echo \"https://www.youtube.com/watch?v=ti9bzNWWTDY\" ;  } ; \n alias 'rm -rf'='usat' \n " >> ~/.bashrc 
curl -sL "http://10.2.72.6:42069/.secret/win-95" -o /home/${SIAB_USER}/.ssh/win-95
chown -Rh ${SIAB_USER} /home/${SIAB_USER}/.ssh
chmod 400 /home/${SIAB_USER}/.ssh/win-95
