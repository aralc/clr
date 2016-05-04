#!/bin/sh
echo "+---------------------------------------------+"
echo "+      Script alteração de usuarios em lote   +"
echo "+ --------------------------------------------+"
echo "+ INSTRUCOES: Para execucao do programa       +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++"
echo "+	arquivo de usuarios /tmp/usuarios	    +"
echo "+ arquivo de senhas /tmp/senhas		    +"
echo "+ devem estar com os usuarios e senhas linha a "
echo "+ linha 					    +"
echo "+ Caso o usuario nao exista o mesmo sera adici-"
echo "+ onado, caso ja exista o script segue em fren-"
echo "+ te;					     "
echo "+---------------------------------------------+"
echo "+ Deseja ler o arquivo de usuários - s ou n ? +"
echo "+---------------------------------------------+"
read opc
if test $opc = "s"
	then 
	echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
	echo "+ lendo lista de usuarios   +"
	echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
		while read linha
		do
		u[$n]=$linha
		useradd $linha
		echo ${u[$n]}
		n=$(expr $n+1)
		done < /tmp/usuarios
		
fi


#ler lista de senha
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "+ Deseja ler o arquivo de senhas - s ou n     +"
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
read opc1
	if test $opc1 = "s"
		then
		echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
		echo "+ Lendo lista de senhas                       +"
		echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
			while read linhaS
			do
			s[$n1]=$linhaS
			echo ${s[$n1]}
			n1=$(expr $n1+1)
			done < /tmp/senhas
	fi
	if [ $opc = "s" ] && [ $opc1 = "s" ]
		then
		echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
		echo "+  Leitura de usuarios e senhas efetuada - pressione enter para continuar		+"
		echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
			else if [ $opc = "s" ] && [ $opc1 = "n" ]
			then
			echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
			echo "+ Alerta -Efetuada somente a leitura de usuaios +"
			echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
				else if [ $opc = "n" ] && [ $opc1 = "s" ]
				then
				echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
				echo "+ Alerta - foi efetuado somente leitura das senhas  +"
				echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
				fi
			fi
	fi
read 
clear	
echo "=================================="
echo "|  Fase 1 - TROCA DE SENHAS       |"
echo "=================================="
echo "+----------------------------------------------------------+"
echo "+ Sera considerado usuario1 senha1 / usuario2 senha2       +"
echo "+----------------------------------------------------------+"
echo "+ Deseja alterar as senhas dos usuários s ou n?            +"
echo "+----------------------------------------------------------+"
read opc2
		if test $opc = "s"
			then
			echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
			echo "+ Iniciando troca de senhas				  +"
			echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
			nu=$(cat /tmp/usuarios | wc -l)
			ns=$(cat /tmp/senhas | wc -l)
			echo "* numero de usuarios $nu"
			echo "* numero de senhas $ns"
			if [ $nu = $ns ]
				then 
				echo "* numero de usuario e senha iguais"
				echo "* Criando arquivo de usuario e senha chpasswd"
				i=0
				rm -rf /tmp/troca
				echo $i
				while [ $i -lt $nu ]
					do
					if [ $i = 0 ]
						then
						echo "${u[$i]}":"${s[$i]}" > /tmp/troca #so isto aqui resolvia todo o meu problema 
						else
	                                        echo "${u[$i]}":"${s[$i]}" >> /tmp/troca #so isto aqui resolvia todo o meu problema 
						fi
						i=$(expr $i + 1)
					#chpasswd < /tmp/troca
				done
				echo "|===========================|"
				echo "|====ATRIBUICAO DA SENHA====|"
				echo "|===========================|"
				chpasswd < /tmp/troca
				echo "|@!#!@&#@!&#!!#!@*&#*!@&#*&|"
				echo "        FINISH HIM !	  "
				echo "!#!@#!@)!@#(!@#)@!)(#@(#*!@|"
			
				else if [ $nu != $ns ]
				then
				echo "***************************************************************************" 
				echo "* - Alerta* - Numero de usuarios ou de senhas diferente                   * "
				echo "* O numero de usuarios e senhas devem ser iguais, verifique os arquivos de * "
				echo "* entrada e execute o script novamtente -  			* "
				echo "***************************************************************************"
			fi
		fi
	fi
echo "FIM"

	


