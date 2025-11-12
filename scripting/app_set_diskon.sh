#!/bin/bash

#membuat aplikasi sederhana untuk setting harga diskon suatu barang  dengan tampilan seperti contoh(ada contohnya)
#
#masukkan nama produk
while true;do
	echo -n "Masukkan Nama Produk  : "
	read produk
	echo -n "Masukkan Harga Produk : Rp "
	read harga
	if [[ $harga  =~ ^[0-9]+$ ]];then
		echo -n ""
	else
		echo "Input -Harga- Tidak Valid!"
		break
	fi
	echo -n "Masukkan Diskon (%)   : "
	read diskon
	if ! [[ $diskon =~ ^[0-9]+$ ]];then
		echo "Input -Diskon- Tidak Valid!"
		break
	fi

	#tampilan detail diskon
	echo "--- Detail Diskon ---"
	echo "Nama Produk     : Rp $produk"
	echo "Harga Produk    : Rp $harga"
	echo "Diskon          : Rp $diskon"

	#potongan harga / harga diskon
	(( diskon_produk=harga * diskon / 100))
	echo "Potongan Harga  : Rp $diskon_produk"

	#harga setelah diskon
	((harga_akhir = harga-diskon_produk))
	echo "Harga Akhir     : Rp $harga_akhir"

	echo
	echo -n "Apakah ingin menghitung produk lain? (y/n): "
	read jawab

	if [[ $jawab == "n" || $jawab == "N" ]];then
		echo "Terimakasih Program Selesai"
		break
	elif [[ $jawab == "y" || $jawab == "Y" ]];then
		echo "Baik, Silahkan Input Data Produk"
		echo
	else
		echo "Input Tidak Sesuai!"
		echo "Program Akan Dihentikan"
		break
	fi
done
