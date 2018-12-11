#!/bin/sh
# pfping.sh
#
# Criador: Jeremia Alves Queiroz
# Data: 07/06/2018
#
# Versao 1: Executa o teste de ping de uma interface específica

# Variaveis iniciais

ajuda="
Uso: $(basename "$0") Interface destino [OPTION]

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

if [ -z "$3" ]
then
    fping -r 1 -t 150 -S $end $2 > /dev/null
    echo $?
else
    fping -r 1 -t 990 -eS $end $2 | cut -d ' ' -f 4 | cut -d '(' -f 2
fi
