#!/bin/bash
listaxml=$(ls *.xml)
#echo $listaxml
#echo "VAMOS LA"
echo -e "\033[0;31m INFORMAR O PARAMETRO \033[0m"
read p
for i in $listaxml
do
var=$(cat $i | grep "<dEmi>" | awk -F "<dEmi>" '{print $2-$3}')
echo $var
if [ $var -gt $p ]
then
mv $i backup
fi


read a
done
