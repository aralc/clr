#!/bin/bash
echo -e "\033[0;31m Oque deseja procurar?: \033[0m"
read ext 
echo -e "\033[0;31m Em qual dos diretorios abaixo \033[0m"
unidade=$(df -h | awk '{print $5}' | cut -d % -f2)
for listau in $unidade
	do
	cont=$(expr $cont + 1)
	echo -e "\033[1;31m $cont : $listau \033[0m"
	uni_vetor[$cont]=$listau
	done
echo $cont
read opc

	case $opc in 
	1|/ 	) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
				opcU1=$(find / -name "$ext")
				for Unidadetamanho in $opcU1
					do
					echo -e "\033[1;33m $Unidadetamanho \033[0m"
					tamanho=$(du -ah $Unidadetamanho)
					echo "$tamanho"
					done
					;;
	 2|dados         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;
	 3|dados1         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;
	 4|home         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;
	 5|var         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;
	 6|opt         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;
	 7|tmp         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;

	 8|usr         ) echo -e "\033[0;31m Iniciando processo de busca na unidade ${uni_vetor[$opc]}  \033[0m"
                                opcU1=$(find /${uni_vetor[$opc]} -name "$ext")
                                for Unidadetamanho in $opcU1
                                        do
                                        echo -e "\033[1;33m $Unidadetamanho \033[0m"
                                        tamanho=$(du -ah $Unidadetamanho)
                                        echo "$tamanho"
                                        done
                                        ;;





	
	* ) echo "escolha uma unidade valida"
	esac

