#!/bin/sh
# pfspeed.sh
#
# Criador: Jeremia Alves Queiroz
# Data: 07/06/2018
#
# Versao 1: Executa o teste de velocidade utilizando o speedtest-cli

# Variaveis iniciais

ajuda="
Uso: $(basename "$0") Interface 

-l printa a latência
"
# Se o comando for executado sem argumentos sera exibida a tela de
# ajuda e terminara o script

if [ -z "$1" ] 
then
    echo "$ajuda"
    exit 0
fi

end=`ifconfig $1 | grep 'inet ' | cut -d ' ' -f 2`

/scripts/speedtest-cli --source $end --simple
