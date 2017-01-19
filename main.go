package main

import (
	"fmt"
	"github.com/labstack/echo"
)

func main() {
	fmt.Println("vim-go")

	e := echo.New()
	e.Logger.Debug(e.Start("0.0.0.0:" + os.Getenv("PORT")))
}
