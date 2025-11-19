package main

import (
	"fmt"
	"math"
)

type Shape interface {
	Area() float64      //untuk hitung luas
	Perimeter() float64 //untuk hitung keliling
}

// ======================================persegi
// struct persegi
type SquareSize struct {
	side float64
}

// function cari luas persegi
func (s SquareSize) Area() float64 {
	// luas = sisi x sisi
	return s.side * s.side
}

// function cari keliling persegi
func (s SquareSize) Perimeter() float64 {
	// keliling = 4 x sisi
	return 4 * s.side
}

// ====================================persegi panjang
// struct persegi panjang
type RectangleSize struct {
	height float64
	width  float64
}

// function untuk mencari luas persegi panjang
func (r RectangleSize) Area() float64 {
	// luas = panjang x lebar
	return r.height * r.width
}

// function untuk mencari keliling persegi panjang
func (r RectangleSize) Perimeter() float64 {
	// keliling = (2*panjang)+(2*lebar)
	return 2*r.height + 2*r.width
}

// ====================================persegi panjang sama sisi
// struct segitiga
type TriangleSize struct {
	base   float64 //alas
	height float64 //tinggi
}

// function untuk menghitung luas segitiga
func (t TriangleSize) Area() float64 {
	// luas = alas x tinggi / 2
	return t.height * t.base / 2
}

// function untuk menghitung keliling segitiga
func (t TriangleSize) Perimeter() float64 {
	// keliling = 3 x sisinya(alas)
	return t.base * 3
}

// ====================================lingkaran
// struct lingkaran
type CircleSize struct{
	radius float64
}

// function untuk mencari luas lingkaran
func (r CircleSize)Area()float64{
	// luas = pi x radius x radius
	return math.Pi*r.radius*r.radius
}
// function untuk mencari keliling lingkaran
func (r CircleSize)Perimeter()float64{
	// keliling = 2 x pi x radius
	return 2*math.Pi*r.radius
}

// ====================================trapesium
// struct untuk trapesium
type TrapezoidSize struct{
	sideTop float64
	sideBottom float64
	sideLeft float64
	sideRight float64
	height float64
}

// function untuk mencari luas trapesium
func (t TrapezoidSize)Area() float64{
	//luas = ( (sisiBawah+sisiAtas) x tinggi)/2
	return ( (t.sideTop+t.sideBottom)*t.height)/2
}

// function untuk mencari keliling trapesium
func (t TrapezoidSize)Perimeter()float64{
	// keliling = sisiAtas + sisiBawah + sisiKanan + sisiKiri
	return t.sideBottom+t.sideTop+t.sideLeft+t.sideRight
}

// function tampilkan
func ProcessShape(name string, sh Shape) {
	fmt.Printf("%s => Luas: %.2f | keliling: %.2f\n", name, sh.Area(), sh.Perimeter())
}

func main() {
	square := SquareSize{side: 4}
	rectangle := RectangleSize{height: 4, width: 3}
	triangle := TriangleSize{base: 4, height: 3}
	circle:=CircleSize{radius: 7}
	trapezoid:=TrapezoidSize{sideTop: 3, sideBottom: 5, height: 2, sideLeft: 4, sideRight:4 }

	ProcessShape("Persegi", square)
	ProcessShape("Persegi Panjang", rectangle)
	ProcessShape("Segitiga", triangle)
	ProcessShape("Lingkaran", circle)
	ProcessShape("Trapesium",trapezoid)
}
