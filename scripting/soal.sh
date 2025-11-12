#!/bin/bash

#buatlah program untuk mengambil nilai ganjil dari urutan data berikut
#dan menjumlahkan nilainya: data [3,6,7,8,9,11,4,9,5,2,2,4,6,6]

#deklarasi data array dan isinya
data=(3 6 7 8 9 11 4 9 5 2 2 4 6 6)
ganjil=0
genap=0
semua=""

#perulangan dulu, baru cek kondisi=>apakah dia bilangan ganjil/tidak
for angka in "${data[@]}"; do
	#echo -n "$angka "
	semua+="$angka "
	if (( angka % 2 == 1 )); then
		#echo -n "$angka "
		data_ganjil+="$angka "
		((ganjil += angka))
	elif ((angka %2 == 0 )); then
		data_genap+="$angka "
		((genap += angka))
	fi
done

echo "data = $semua"
echo "data ganjil = $data_ganjil"
echo "total angka ganjil = $ganjil"
echo "data genap = $data_genap"
echo "total angka genap = $genap"



