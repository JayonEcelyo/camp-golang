package utils

import (
    "errors"
    "regexp"
)

func ValidateEmail(email string) error {
    regex := `^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$`
    re := regexp.MustCompile(regex)

    if !re.MatchString(email) {
        return errors.New("email tidak valid, contoh: user@gmail.com")
    }
    return nil
}


func ValidatePhone(phone string) error {
    if len(phone) < 10 || len(phone) > 15 {
        return errors.New("nomor harus 10-15 digit")
    }
    for _, ch := range phone {
        if ch < '0' || ch > '9' {
            return errors.New("nomor hanya boleh angka")
        }
    }
    return nil
}

func ValidatePassword(pass string) error {
    if len(pass) < 6 {
        return errors.New("password minimal 6 karakter")
    }
    return nil
}
