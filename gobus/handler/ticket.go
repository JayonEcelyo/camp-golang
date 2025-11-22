package handler

import (
	"fmt"

	"gobus/dto"
	"gobus/service"
)

type TicketHandler struct {
	service *service.TicketService
}

func NewTicketHandler(service *service.TicketService) *TicketHandler {
	return &TicketHandler{service: service}
}

func (h TicketHandler) Process(req dto.Request) {

	ticket, err := h.service.CreateTicket(req)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	fmt.Println("\n===Harga Tiket===")
	fmt.Println("Penumpang :", ticket.Name)
	fmt.Println("Tujuan    :", ticket.Destination)
	fmt.Printf("Harga     : Rp %.2f", ticket.Price)
	fmt.Println("\n=================")
}
