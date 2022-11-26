# GTA V FIVEM

Instalação mínima de um servidor fivem

Baixe o projeto:
```
clone https://github.com/mantenedor/gta.git
```
Gere uma chave para seu servidor em: https://keymaster.fivem.net/

Crie o arquivo ".keymaster" contendo a sua chave no diretório "./fivem/":
```
cd gta && echo "chaveMuitoL0kaGeradaNoSiteFIVEM" > fivem/.keymaster
```
Execute o script de instalação:
```
cd scripts && ./server.sh --build
```
Pronto. Seu servidor está rodando na porta 30120
