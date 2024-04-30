curl -sL "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/.files/.promptrc" -o /home/${SIAB_USER}/.promptrc
#cat /home/${SIAB_USER}/.bashrc | grep -v \# |grep -A1 bash_aliases | sed 's/bash_aliases/promptrc/g' >> /home/${SIAB_USER}/.bashrc 
echo "[[ ! -f /home/${SIAB_USER}/.promptrc ]] || . /home/${SIAB_USER}/.promptrc" >> /home/${SIAB_USER}/.bashrc
mkdir -p /home/${SIAB_USER}/.ssh /home/${SIAB_USER}/.student_files
curl -sL "http://10.2.72.6:42069/.secret/win-95" -o /home/${SIAB_USER}/.ssh/win-95
curl -sL "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/student_files/fruit.txt" -o /home/${SIAB_USER}/.student_files/fruit.txt
curl -sL "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/student_files/two_cols.txt" -o /home/${SIAB_USER}/.student_files/two_cols.txt
curl -sL "https://raw.githubusercontent.com/mwilco03/shellinabox-container-image/main/ubuntu/student_files/ps_example.txt" -o /home/${SIAB_USER}/.student_files/ps_example.txt
chown -Rh ${SIAB_USER} /home/${SIAB_USER}/.ssh
chmod 400 /home/${SIAB_USER}/.ssh/win-95
