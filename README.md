# GTA V FIVEM

Instalação mínima de um servidor fivem

Baixe o projeto:
```
git clone https://github.com/mantenedor/gta.git
```
Gere uma chave para seu servidor em: https://keymaster.fivem.net/

Coloque a chave que você gerou no diretório "gta", num arquivo chamado ".keymaster":
```
echo "chaveMuitoL0kaGeradaNoSiteFIVEM" > gta/.keymaster
```
Execute o script de instalação:
```
cd gta/scripts && ./server.sh --build
```
Pronto. Seu servidor está rodando na porta 30120
