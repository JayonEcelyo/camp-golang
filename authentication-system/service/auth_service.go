package service

import (
	"auth-system/model"
	"auth-system/repository"
	"auth-system/utils"
	"errors"
)

type AuthService struct {
    Repo repository.AuthRepository
}

func NewAuthService(repo repository.AuthRepository) *AuthService {
    return &AuthService{Repo: repo}
}

func (s *AuthService) Register(email, phone, password string) error {
    if err := utils.ValidateEmail(email); err != nil {
        return err
    }
    if err := utils.ValidatePhone(phone); err != nil {
        return err
    }
    if err := utils.ValidatePassword(password); err != nil {
        return err
    }

    hashed := utils.HashPassword(password)
    user := model.User{Email: email, PhoneNumber: phone, Password: hashed}

    return s.Repo.SaveUser(user)
}

func (s *AuthService) Login(email, password string) error {
    user, err := s.Repo.GetUserByEmail(email)
    if err != nil {
        return err
    }

    if utils.HashPassword(password) != user.Password {
        return errors.New("password salah")
    }

    return nil
}
