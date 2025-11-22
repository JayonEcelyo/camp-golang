package dto

type Response struct {
	Passenger   string
	Destination string
	Price       int
}

func NewResponse(p, d string, price int) Response {
	return Response{
		Passenger:   p,
		Destination: d,
		Price:       price,
	}
}
