package main

import (
	"auth-system/handler"
	"auth-system/repository"
	"auth-system/service"
	"fmt"
)

func main() {
    repo := repository.NewAuthRepository()
    service := service.NewAuthService(repo)
    handler := handler.NewAuthHandler(service)

    for {
        fmt.Println("\n=== MENU ===")
        fmt.Println("1. Register")
        fmt.Println("2. Login")
        fmt.Println("3. Exit")

        var choice int
        fmt.Print("Choose: ")
        fmt.Scanln(&choice)

        switch choice {
        case 1:
            handler.Register()
        case 2:
            handler.Login()
        case 3:
            fmt.Println("Bye!")
            return
        default:
            fmt.Println("Pilihan tidak valid!")
        }
    }
}
