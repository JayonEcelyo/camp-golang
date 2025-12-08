package repository

import (
	"auth-system/model"
	"encoding/json"
	"errors"
	"io/ioutil"
)

var filePath = "data/users.json"

type AuthRepository interface {
    SaveUser(user model.User) error
    GetUserByEmail(email string) (*model.User, error)
}

type authRepo struct{}

func NewAuthRepository() AuthRepository {
    return &authRepo{}
}

func (r *authRepo) readUsers() ([]model.User, error) {
    data, err := ioutil.ReadFile(filePath)
    if err != nil {
        return []model.User{}, nil
    }

    var users []model.User
    json.Unmarshal(data, &users)
    return users, nil
}

func (r *authRepo) SaveUser(user model.User) error {
    users, _ := r.readUsers()

    for _, u := range users {
        if u.Email == user.Email {
            return errors.New("email sudah terdaftar")
        }
    }

    users = append(users, user)
    newData, _ := json.MarshalIndent(users, "", "  ")
    return ioutil.WriteFile(filePath, newData, 0644)
}

func (r *authRepo) GetUserByEmail(email string) (*model.User, error) {
    users, _ := r.readUsers()

    for _, u := range users {
        if u.Email == email {
            return &u, nil
        }
    }

    return nil, errors.New("email tidak ditemukan")
}
