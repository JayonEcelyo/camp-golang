package handler

import (
	"auth-system/service"
	"bufio"
	"fmt"
	"os"
	"strings"
)

type AuthHandler struct {
    Service *service.AuthService
}

func NewAuthHandler(s *service.AuthService) *AuthHandler {
    return &AuthHandler{Service: s}
}

func (h *AuthHandler) Register() {
    reader := bufio.NewReader(os.Stdin)

    fmt.Print("Email: ")
    email, _ := reader.ReadString('\n')
    email = strings.TrimSpace(email)

    fmt.Print("Phone: ")
    phone, _ := reader.ReadString('\n')
    phone = strings.TrimSpace(phone)

    fmt.Print("Password: ")
    password, _ := reader.ReadString('\n')
    password = strings.TrimSpace(password)

    if err := h.Service.Register(email, phone, password); err != nil {
        fmt.Println("Error:", err.Error())
        return
    }

    fmt.Println("Register berhasil!")
}


func (h *AuthHandler) Login() {
    reader := bufio.NewReader(os.Stdin)

    fmt.Print("Email: ")
    email, _ := reader.ReadString('\n')

    fmt.Print("Password: ")
    password, _ := reader.ReadString('\n')

    // Bersihkan newline
    email = strings.TrimSpace(email)
    password = strings.TrimSpace(password)

    if err := h.Service.Login(email, password); err != nil {
        fmt.Println("Error:", err.Error())
        return
    }

    fmt.Println("Login berhasil!")
}

