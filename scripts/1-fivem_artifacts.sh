#!/bin/bash

#
# Baixa os artefatos do fivem e arquivos essesnciais
# Criado: 11/2022
# Autor: Wagton Azevedo
# Referência: https://docs.fivem.net/docs/server-manual/setting-up-a-server-vanilla/#linux
#

KEYMASTER=`cat ../fivem/.keymaster`
MASTER="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master"
CFX="https://github.com/citizenfx/cfx-server-data.git"
FILE=`curl -qs https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | grep "LATEST RECOMMENDED" -B1 | head -n1 | cut -d'"' -f2 | cut -d'/' -f2-3`
ARTIFACTS="../fivem/essenciais"

function GET {
	wget $MASTER/$FILE -P $ARTIFACTS
}

function KEY {
	if [ -z $KEYMASTER ];then

		echo ""
		echo 'Você precisa obter uma "Keymaster"!'
		echo ""
		echo 'Acesse https://keymaster.fivem.net ...'
		echo 'Autentique-se...'
		echo 'Informe um nome para sua chave...'
		echo "Informe o IP de saída do seu servidor (`curl -sq https://api.ipify.org`)..."
		echo 'Informe o tipo de servidor...'
		echo 'Copie a chave e crie um arquivo chamado ".keymaster" no diretório "fivem" com a chave dentro.'
		echo 'Repita o processo de deploy.'
		echo ""
		exit
	else
		cp ../fivem/server.default $ARTIFACTS/server.cfg
		sed -i 's,changeme,'$KEYMASTER',g' $ARTIFACTS/server.cfg
	fi
}

function INSTALL {
	TAR=`echo $FILE | cut -d/ -f2`
	echo $TAR
	tar xvf $ARTIFACTS/$TAR --directory $ARTIFACTS
	rm -f $ARTIFACTS/$TAR
	mkdir /tmp/data
	git clone $CFX /tmp/data
        mv /tmp/data/* $ARTIFACTS
}

KEY
GET
INSTALL
