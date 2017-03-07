#!/bin/bash
###################################################
# Autor: Marcos Moraes 				  #
# Data : 05/03/2017				  #
# E-mail: mthiago.info@gmail.com		  #
# site : http://www.bacteriadebits.com.br         #
# Os bits substituem os átomos                    #
###################################################

busca_f()
	{
	if [ $e == "a" ]
	then
	lista=$(find $l -name "$a")
	else
	lista=$(find $l -type $e -name "$a")
	#echo -e $lista
	fi
		for i in $lista
		do
		tt=$(echo -e ${#i})
		echo -e "\033[4;31m $tt \033[0m | \033[4;32m $i \033[0m"
		barra_c=$(echo barras: $i | fgrep -o / | wc -l)
		barra_c=$(expr 1 + $barra_c)
		var=$(echo $i | cut -d "/" -f 1-$barra_c)
		cp -r $var bkp$data
		rm -rf $var
				
		read ggg
		
		done
	}



echo -e "\033[3;31m Ola usuário $(whoami) \033[0m"
echo -e "\033[3;32m *#*#*#*#*#*#*#*#*#* \033[0m"
echo -e "\033[3;33m Este script foi criado para efetuar buscas de arquivos,
		 e pastas utilizando o parâmetro de tamanho ! \033[0m"
echo -e "\033[3;34m Qual o tamanho para limite o limite da busca ? \033[0m" 
read t
echo -e "\033[3;35m Informe se deseja buscar arquivos, pastas ou ambos 
		f - arquivos 
		d - pastas
		a - todos \033[0m"
read e
echo -e "\033[35m Informe o tipo de parametro para busca do arquivo ?
	        Caracter corignas :
		* - substitui tudo a direita
		? - substitui posicao especifica 
		Exemplo de buscas :
		*.sh - arquivos extensão .sh 
		*    - buscar qualquer tipo de arquivo 
		nome*.conf - arquivo de configuracao especifico \033[0m"	
read a
echo -e "\033[35m Informe a localização onde deseja efetuar a busca 
		/ - Diretorio raiz 
		/local/local2 - exemplo 
		/media/usb - exemplo 
		\033[0m"
read l



echo -e "\033[3;36m os parâmetros 
	 tamanho : $t
	 tipo : $e  
	 busca : $a 
	 local : $l \033[0m "
data=$(date +"%d"."%m"."$y"_"%H":"%M")
echo $data
	mkdir bkp$data
case $e in 
	f) 
	echo -e file 
	e="f"
	busca_f
	;;
	d)
	echo -e pasta
	e="d"
	busca_f
	;;
	a)
	echo -e all
	e="a"
	busca_f
	;;
	*) echo -e escolha uma opcao válida 
esac 




