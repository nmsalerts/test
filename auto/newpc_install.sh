
#!/bin/bash
user="admin"
pwd="TransitCCL@321"
pwd="nimdaCC@321"
pwd="zaq1@#WSX"
logfile="cc_system_creation.log"
echo "`date`====Starting====" >> ${logfile}

log()
{
echo ${*}
echo ${*} >> ${logfile}
}

execute()
{
sshpass -p "$pwd" ssh -tt -o StrictHostKeyChecking=no $user@"$2" "$1" | tee -a ${logfile}
}

while read line <&3 #This is required to make outer loop read from file, and inside loop reads from stdin
do
ip=$line
str="Starting client ip ${ip} at `date`"
log ${str}

#Make admin to sudo
cmd="echo \"${pwd}\" | sudo -Sk usermod -aG sudo admin"
str="Adding admin to sudo cmd :: ${cmd}"
log ${str}
execute "${cmd}" "${ip}"

#Remove csenet user
cmd="echo \"${pwd}\" | sudo -Sk userdel -r csenet"
str="Removing csenet user cmd :: ${cmd}"
log ${str}
execute "${cmd}" "${ip}"

#Remove user login
cmd="echo \"${pwd}\" | sudo -Sk userdel -r user"
str="Removing user login cmd :: ${cmd}"
log ${str}
execute "${cmd}" "${ip}"

#Install required packages
cmd="echo \"${pwd}\" | sudo -Sk apt-get install virtualbox vim bison flex  git default-jdk default-jre emacs gcc g++ net-tools ncdu libbison-dev nasm vim-gtk3 libboost-all-dev -y"
str="executing cmd :: ${cmd}"
log ${str}
execute "${cmd}" "${ip}"

#Copy vscode.deb
str="Copying vscode.deb"
log ${str}
scp vscode.deb $user@${ip}:~/

#Install vscode
cmd="echo \"${pwd}\" | sudo -Sk dpkg -i vscode.deb"
str="Installing vscode cmd :: ${cmd}"
log ${str}
execute "${cmd}" "${ip}"

str="Completed Client ip ${ip} at `date`"
log ${str}

done 3< ips

echo "`date`===Completed===" >> ${logfile}
