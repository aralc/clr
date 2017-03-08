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
		if [ $tt -gt $t ]
			then
				
			var=$(echo $i | cut -d "/" -f 1-$barra_c)
			echo $var
			var2=$(echo $i | cut -d "/" -f $barra_c)
			echo $var2
			barra_o=$(expr $barra_c - 1)
			var_origem=$(echo $i | cut -d "/" -f 1-$barra_o)
			
			count=$(expr $count + 1)
			cd $var_origem
			mv $var2 /tmp/bkp$data
			tar -cvzf /tmp/bkp$data/$var2.$count.tar.bz2 /tmp/bkp$data
	                echo -e "Arquivo ou Pasta ; $var2 ; estava em ; $var_origem ; com o nome destino ; $var2.$count.tar.bz2  " >> /tmp/bkp$data/leiame.txt

			cd /tmp/bkp$data
			rm -rf $var2
			#rm -rf $var
			
		fi
				
		read ggg
		
		done
	}



echo -e "\033[3;31m Ola usuário $(whoami) \033[0m"
echo -e "\033[3;32m *#*#*#*#*#*#*#*#*#* \033[0m"
echo -e "\033[3;33m Este script foi criado para efetuar buscas de arquivos,
		 e pastas utilizando o parâmetro de tamanho ! 
		- O script ira pegar os arquivos que estao excedendo o tamanho 
		e ira mover para pasta criada com o nome de bkp_data no diretorio tmp 
		apos isto os arquivos serao compactados \033[0m"
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
data=$(date +"%d"."%m"."$y"."%H":"%M")
echo $data
	mkdir /tmp/bkp$data
	touch /tmp/bkp$data/leiame.txt
	echo " " >> /tmp/bkp$data/leiame.txt
	echo "VOCE PODE IMPORTAR PARA O EXCEL"
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




