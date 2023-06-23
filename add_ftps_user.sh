#!/bin/bash
#
#  make sure vsftpd runs with the following user:
#
#  nopriv_user=mescedia
#  guest_username=mescedia
#

if [ $# -ne 2 ]
  then
    echo "invalid arguments - usage: $0 [UserName] [Password]"
    exit
fi
#
user=$1
passwd=$2
#
sysuser=mescedia
sysgroup=mescedia-system
base=/opt/mescedia/ftps/users
#
mkdir $base/$user
mkdir $base/$user/in
mkdir $base/$user/out
chown $sysuser:$sysgroup $base/$user -R
chmod 550 $base/$user -R
chmod 750 $base/$user/in/
chmod 750 $base/$user/out/
mysql -u mescedia -pmescedia -e "use mescedia; INSERT INTO pamUser (Name, Password, Active) VALUES(\"$user\",  PASSWORD(\"$passwd\"), 1) ;"
