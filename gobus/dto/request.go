package dto

type Request struct {
	Passenger   string
	Destination string
}

func NewRequest(passenger, destination string) Request {
	return Request{
		Passenger:   passenger,
		Destination: destination,
	}
}
