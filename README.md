# GTA V FIVEM

Se você pretende montar um servidor de GTA RP, explorar o conceito de metaverso ou criar sua próprias bibliotecas, você precisará realizar este deploy inicial, antes de começar o seu trabalho.

Neste caso, eu optei por utilizar um servidor Linux e container.

[![Watch the video](https://img.youtube.com/vi/kwy48L_lFSc/maxresdefault.jpg)](https://youtu.be/kwy48L_lFSc)

* FIVEM: https://fivem.net/
* Docker: https://docs.docker.com/engine/install/debian/
* Debian: https://hub.docker.com/_/debian

## Estrutura
```
.
├── docker-compose.yml
├── Dockerfile
├── fivem
│   ├── essenciais
│   └── server.default
├── README.md
└── scripts
    ├── 1-fivem_artifacts.sh
    ├── 2-start.sh
    ├── build.sh
    └── server.sh
```
## Instalação mínima de um servidor fivem

1. Baixe o projeto:
```
git clone --branch custom-scripts https://github.com/mantenedor/gta.git
```
2. Gere uma chave para seu servidor em: https://keymaster.fivem.net/

3. Coloque a chave que você gerou no diretório "gta", num arquivo chamado ".keymaster":
```
echo "chaveMuitoL0kaGeradaNoSiteFIVEM" > gta/.keymaster
```
4. Execute o script de instalação:
```
cd gta/scripts && ./server.sh --build
```
5. Instale seus scripts:
```
cd gta/fivem/essenciais/resources/
ln -s ../../custom/ [custom]
```
6. carregue seus scripts:
```
vim gta/fivem/essenciais/server.cfg
```
O caomando "ensure" invoca os scripts. Insira o comando seguido do nome do diretório do seu script: 
```
...
# CUSTOM
ensure carros
ensure help
ensure spawns
...
```
7. Reinicie o container:
```
docker restart gta
````
8. Inicie o fivem:
```
docker exec -it gta /bin/bash /opt/scripts/2-start.sh
```

Pronto. Seu servidor, juntamente com seus scripts, estão rodando na porta 30120
