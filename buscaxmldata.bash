#!/bin/bash
# script para busca de nota fiscais com ano de emissao inicio em 2012 
# criado por : Marcos Moraes 
# data : 28/03/2017 
########################################################################
#gerar lista de xml's

#
#-lt	É menor que (LessThan)
#-gt	É maior que (GreaterThan)
#-le	É menor igual (LessEqual)
#-ge	É maior igual (GreaterEqual)
#-eq	É igual (EQual)
#-ne	É diferente (NotEqual)


 
listaxml=$(ls *.xml)
echo -e "\033[1;34m SEJA BEM VINDO AO FINDCONTXML \033[0m"
echo -e "\033[1;33m VAMOS COMECAR \033[0m"
echo -e "\033[0;31m INFORMAR O PARAMETRO BASE PARA O ANO \033[0m"
read p
echo -e "\033[0;32m ANO BASE $p \033[0m"
#iniciar busca

for i in $listaxml
	do
	nf=$(cat $i | grep "<nNF>" | awk -F "<nNF>" '{print $2-$3}')
	var=$(cat $i | grep "<dEmi>" | awk -F "<dEmi>" '{print $2-$3}')
	#echo $var
	if [ $var -ge $p ]
		then
		mv $i backup
		echo "nota :" $nf "ano base" $var >> lista_notas_adicionas
		else 
		echo "nota :" $nf "ano" $var "nao adicionada" >> lista_notas_ignoradas
		fi
echo -e "\033[4;33m $nf PROCESSADA \033[0m"
done
