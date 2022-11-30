# GTA V FIVEM

O VRP framework tra várias impementações comunmente utilizadas em servidors RP (roleplaying).

Se você pretende montar um servidor de GTA RP, explorar o conceito de metaverso ou criar sua próprias bibliotecas, você precisará realizar este deploy inicial, antes de começar o seu trabalho.

E recomendável que você exponha esses diretórios como volume, quando estestiver trabalhando com containers. Isso garantirá a persistência dos arquivos e facilitará a manutenção do código.

Neste ramo, além de implementar 2 containers (httpd e mysql),apenas instalei o VRP framework.

Crie novos diretórios e links simbólicos para orgnizar o seu projeto.

* FIVEM: https://fivem.net/
* Framework VRP: https://github.com/vRP-framework/vRP


## Estrutura
```
.
├── docker-compose.yml
├── Dockerfile
├── fivem
│   ├── custom
│   ├── essentials
│   ├── server.default
│   └── vRP-master
├── README.md
├── scripts
│   ├── 1-fivem_artifacts.sh
│   ├── 2-install_custom_scripts.sh
│   ├── 3-install_vrp.sh
│   ├── 4-start.sh
│   ├── build.sh
│   └── server.sh
└── web
    ├── conf
    ├── Dockerfile
    └── html
```
## Instalação mínima de um servidor fivem

1. Baixe o projeto:
```
git clone --branch VRP https://github.com/mantenedor/gta.git
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

Pronto. Seu servidor está rodando com um banco de dados, um servidor de páginas e o framework VRP instalados, nas portas 30120,3306,80 e 443.
