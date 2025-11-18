package main

import (
	"fmt"
)

func HitungTarifParkir(durasiJam int, isMember bool, isHariLibur bool) int {
	tarifDasar := 5000  
	tarifPerJamBerikutnya := 2000 
	totalBiaya := 0

	if durasiJam <= 2 {
		totalBiaya = tarifDasar
	} else {
		jamBerikutnya := durasiJam - 2
		biayaJamBerikutnya := jamBerikutnya * tarifPerJamBerikutnya
		totalBiaya = tarifDasar + biayaJamBerikutnya
	}

	if isMember {
		diskon :=0
		if durasiJam <= 5 {
			diskon = 50
		} else {
			diskon = 30
		}
		
		totalBiaya = totalBiaya * (100 - diskon)/100
	}

	biayaHariLibur := 3000
	if isHariLibur {
		totalBiaya += biayaHariLibur
	}

	return totalBiaya
}

func main() {	
	// Soal 1: Seseorang parkir selama 4 jam, bukan member, dan bukan hari libur.
	durasi1 := 4
	member1 := false
	libur1 := false
	tarif1 := HitungTarifParkir(durasi1, member1, libur1)
	
	fmt.Println("Kasus 1:")
	fmt.Printf("Durasi: %d jam, Member: %t, Hari Libur: %t\n", durasi1, member1, libur1)
	fmt.Println("Tarif Parkir Total: Rp ", tarif1)

	// Soal 2: Seseorang parkir selama 2 jam, member, tetapi hari libur.
	durasi2 := 2
	member2 := true
	libur2 := true
	tarif2 := HitungTarifParkir(durasi2, member2, libur2)

	fmt.Println("Kasus 2:")
	fmt.Printf("Durasi: %d jam, Member: %t, Hari Libur: %t\n", durasi2, member2, libur2)
	fmt.Println("Tarif Parkir Total: Rp ", tarif2)
}
