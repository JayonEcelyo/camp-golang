package main

import (
	"fmt"

	"gobus/dto"
	"gobus/handler"
	"gobus/service"
)

func main() {

	var nama, tujuan string

	fmt.Println("\n====Beli Tiket===")
	fmt.Print("Masukkan nama penumpang: ")
	fmt.Scanln(&nama)

	fmt.Print("Masukkan tujuan: ")
	fmt.Scanln(&tujuan)

	req := dto.NewRequest(nama, tujuan)

	svc, err := service.NewTicketService()
	if err != nil {
		fmt.Println("Gagal init service:", err)
		return
	}

	h := handler.NewTicketHandler(svc)
	h.Process(req)

}
