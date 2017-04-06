#!/bin/bash
# script para busca de nota fiscais com ano de emissao inicio em 2012# script separa nota fiscal de entrada e saida 
# criado por : Marcos Moraes 
# data : 28/03/2017 
# versão 2 
########################################################################
#gerar lista de xml's

#
#-lt	É menor que (LessThan)
#-gt	É maior que (GreaterThan)
#-le	É menor igual (LessEqual)
#-ge	É maior igual (GreaterEqual)
#-eq	É igual (EQual)
#-ne	É diferente (NotEqual)


 
#listaxml=$(ls *.xml)
ls  > listaxml.txt
echo -e "\033[1;34m SEJA BEM VINDO AO BUSCATORXML v.2 \033[0m"
echo -e "\033[1;33m VAMOS COMECAR \033[0m"
echo -e "\033[0;31m INFORMAR O PARAMETRO BASE PARA O ANO \033[0m"
read p
echo -e "\033[0;31m INFORME O NOME DA EMPRESA \033[0m"
read pasta
echo -e "\033[0;32m ANO BASE $p \033[0m"
mkdir $pasta
echo -e "\033[0;32m DIGITE O CNPJ \033[0m"
read cnpj
#cd $pasta 
mkdir $pasta/$cnpj"_e"
mkdir $pasta/$cnpj"_s"


function_entrada_saida()
#	cd $pasta
#	mkdir saida_$cnpj
#	mkdir entrada_$cnpj
	{	
	case $cnpj in
	$emit) echo NOTA SAIDA
	       mv $i $pasta/$cnpj"_s"
		;;
	$dest) echo NOTA ENTRADA
		mv $i $pasta/$cnpj"_e"
		;;
	*) echo "ABEND"
	esac
	
	}

	


for i in $(cat listaxml.txt)
	do
	nf=$(cat $i | awk -F "<nNF>" '{print $2-$3}')
#	var=$(cat $i | awk -F "<dEmi>" '{print $2}' | awk -F "</dEmi>" '{print $1}' | cut -d "-" -f 1)
#       var2=$(cat $i | awk -F "<dhEmi>" '{print $2}' | awk -F "</dhEmi>" '{print $1}' | cut -d "-" -f 1)
	emit=$(cat $i | awk -F "<emit>" '{print $2}' | awk -F "</emit>" '{print $1}' | awk -F "<CNPJ>" '{print $2}' | awk -F "</CNPJ>" '{print $1}')
	dest=$(cat $i | awk -F "<dest>" '{print $2}' | awk -F "</dest>" '{print $1}' | awk -F "<CNPJ>" '{print $2}' | awk -F "</CNPJ>" '{print $1}')
	versao=$(cat $i | awk -F "<infNFe" '{print $2}' | awk -F ">" '{print $1}' | awk -F "versao" '{print $2}' | cut -d "=" -f 2 | cut -d '"' -f 2)
	echo "+-----------------+"
	echo $i
	echo $nf
	echo $emit
	echo $dest
	echo $versao
	echo "------------------"
	if [ $versao == '3.10' ]
	then
	var2=$(cat $i | awk -F "<dhEmi>" '{print $2}' | awk -F "</dhEmi>" '{print $1}' | cut -d "-" -f 1)
	data=$var2
	else 
        var=$(cat $i | awk -F "<dEmi>" '{print $2}' | awk -F "</dEmi>" '{print $1}' | cut -d "-" -f 1)
	data=$var
	fi

	if [ $data -ge $p ] 
		then
		#mv $i $pasta
		echo "nota :" $nf "ano base" $var "emitebnte" $emit "destinatario" $dest  >> lista_notas_adicionas
		function_entrada_saida
		else 
		echo "nota :" $nf "ano" $var "nao adicionada - ARQUIVPO" $i >> lista_notas_ignoradas
		fi
echo -e "\033[4;33m $nf PROCESSADA \033[0m"
done
