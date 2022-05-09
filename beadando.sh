#!/bin/bash
#curl
curl -i https://drive.google.com/file/d/1zHMr7o03H1Zt0KvpQcX4u8-sMBaAzCDJ/view?usp=sharing -o data.txt
echo "Fájl letöltve"
ls

#fájlkezelés
echo "Két fájl létrehozva (oprendszerek.txt, mobilmárkák.txt)"
printf "Linux\n Mac OS X\n Windows\n Android\n Raspberry\n Symbian\n Bada"> oprendszerek.txt
printf "Samsung\n Apple\n Huawei\n Nokia\n Sony\n LG\n HTC\n Honor\n Motorola"> mobilmárkák.txt
#szűrők
echo "Adj meg egy fájlnevet amiben keresni szeretnél: "
read fileName
if [[ -f $fileName ]]
then 
	echo "Írd be szót amit keresel: "
	read grepvar
	grep -i -n $grepvar $fileName
else
	echo "$fileName nem létezik!"
	echo "$grepvar nem létezik!"
fi
#getops


echo " -o oprendszerek.txt megynitása"
echo " -m mobilmárkák megnyitása"

while getopts :om: opt;do
  case $opt in
	m)
		nano oprendszerek.txt;;
	o)
		nano mobilmárkák.txt;;
  esac
done	
					
