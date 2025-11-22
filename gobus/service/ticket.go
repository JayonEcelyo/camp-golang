package service

import (
	"encoding/json"
	"errors"

	"gobus/data"
	"gobus/dto"
	"gobus/model"
)

type TicketService struct {
	destinations map[string]float64
}

func NewTicketService() (*TicketService, error) {
	var dest map[string]float64

	err := json.Unmarshal([]byte(data.Destinations), &dest)
	if err != nil {
		return nil, err
	}

	return &TicketService{destinations: dest}, nil
}

func (s *TicketService) CreateTicket(req dto.Request) (model.Ticket, error) {
	price, ok := s.destinations[req.Destination]
	if !ok {
		return model.Ticket{}, errors.New("tujuan tidak ditemukan")
	}

	ticket := model.Ticket{
		Name: req.Passenger,
		Destination: req.Destination,
		Price: price,
	}

	return ticket, nil
}
