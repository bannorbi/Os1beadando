#!/bin/bash
curl_function() {
#curl
curl -i https://drive.google.com/file/d/1zHMr7o03H1Zt0KvpQcX4u8-sMBaAzCDJ/view?usp=sharing -o data.txt
echo "Fájl letöltve"
ls
}
file_function() {
#fájlkezelés
echo "Két fájl létrehozva (oprendszerek.txt, mobilmárkák.txt)"
printf "Linux\n Mac OS X\n Windows\n Android\n Raspberry\n Symbian\n Bada"> oprendszerek.txt
printf "Samsung\n Apple\n Huawei\n Nokia\n Sony\n LG\n HTC\n Honor\n Motorola"> mobilmárkák.txt
}
sz_function() {
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
}
help_function() {
#getops
echo " -o oprendszerek.txt megynitása"
echo " -m mobilmárkák megnyitása"
}
while getopts :omhcs opt;do
  case $opt in
	m)
		nano oprendszerek.txt;;
	o)
		nano mobilmárkák.txt;;
	h)
		help_function;;
	c)
		curl_function;;
	s)	
		sz_function;;
	*)	
		echo "Nincs ilyen funkció"
	exit ;;
	
  esac
done
