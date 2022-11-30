#!/bin/bash

# PACKAGES
URL_VRP="https://github.com/vRP-framework/vRP/archive/refs/heads/master.zip"
URL_DB_VRP="https://github.com/vRP-framework/vRP-db-drivers/archive/refs/heads/master.zip"
URL_DB_DRIVER="https://github.com/overextended/oxmysql/releases/download/v2.5.4/oxmysql.zip"

# DB CONNECT
DBADDRESS="db"
BASE="vrp"
USER="vrp"
PASS="scatman"

mkdir ../fivem/essentials/resources/[db]
mkdir ../fivem/essentials/resources/[frameworks]

TAR=`echo $URL_VRP | rev | cut -d'/' -f1 | rev`
wget "$URL_VRP" -P /tmp/
unzip /tmp/$TAR -d ../fivem
rm -rf /tmp/$TAR

TAR=`echo $URL_DB_VRP | rev | cut -d'/' -f1 | rev`
wget "$URL_DB_VRP" -P /tmp/
unzip /tmp/$TAR  -d ../fivem/essentials/resources/[db]
rm -rf /tmp/$TAR

TAR=`echo $URL_DB_DRIVER | rev | cut -d'/' -f1 | rev`
wget "$URL_DB_DRIVER" -P /tmp/
unzip /tmp/$TAR -d ../fivem/essentials/resources/[db]
rm -rf /tmp/$TAR

cp -r ../fivem/essentials/resources/\[db\]/vRP-db-drivers-master/vrp_* ../fivem/essentials/resources/\[db\]
rm -rf  ../fivem/essentials/resources/\[db\]/vRP-db-drivers-master/

sed -i 's,127.0.0.1,db,g' /opt/fivem/essentials/resources/\[frameworks\]/vrp/cfg/base.lua
sed -i 's,vRP,vrp,g' /opt/fivem/essentials/resources/\[frameworks\]/vrp/cfg/base.lua
sed -i 's,password,scatman,g' /opt/fivem/essentials/resources/\[frameworks\]/vrp/cfg/base.lua
echo  "ensure oxmysql"  >> ../fivem/essentials/server.cfg
echo  "ensure vrp_oxmysql"  >> ../fivem/essentials/server.cfg
echo  'set mysql_connection_string "mysql://'$USER':'$PASS'@'$DBADDRESS'/'$BASE'?multipleStatements=true"'  >> ../fivem/essentials/server.cfg

VRP_FOLDER=`ls ../fivem | grep -i vrp`
cd ../fivem/essentials/resources/[frameworks] && ln -s ../../../$VRP_FOLDER/vrp/ vrp
