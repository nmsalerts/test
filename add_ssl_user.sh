#/bin/bash

randpw(){ < /dev/urandom tr -dc _A-Z-a-z-1-9 | head -c8;echo;}

adminpwd="zaq1@#WSX"
adminuser="administrator"

logfile="addusers.log"
echo "`date`====Starting====" >> ${logfile}

log()
{
echo ${*}
echo ${*} >> ${logfile}
}


adduser()
{
pwd=$2
user=$1
ip=$3
str="creating user ${user} in ip ${ip}"
log ${str}

cmd="echo \"${adminpwd}\" | sudo -Sk useradd -m -s /bin/bash ${user}"
sshpass -p "$adminpwd" ssh -tt -o StrictHostKeyChecking=no $adminuser@${ip} "${cmd}" 2>&1 >> ${logfile}

str="${user} created in ${ip}"
log ${str}

cmd="echo \"${adminpwd}\" | sudo -Sk bash -c ' echo \"${user}:${pwd}\" | sudo chpasswd'"
str="changing ${user} passwd to ${pwd} in ${ip}"
log ${str}
sshpass -p "$adminpwd" ssh -tt -o StrictHostKeyChecking=no $adminuser@${ip} "${cmd}" 2>&1 >> ${logfile}

echo "${ip} :: ${user} :: ${pwd}" >> pwd_file

}

adduser ccf-01 ccf01 10.23.101.101
adduser ccf-02 ccf02 10.23.101.102
adduser ccf-03 ccf03 10.23.101.103
adduser ccf-04 ccf04 10.23.101.104
adduser ccf-05 ccf05 10.23.101.105
adduser ccf-06 ccf06 10.23.101.106
adduser ccf-07 ccf07 10.23.101.107
adduser ccf-08 ccf08 10.23.101.108
adduser ccf-09 ccf09 10.23.101.109
adduser ccf-10 ccf10 10.23.101.110
