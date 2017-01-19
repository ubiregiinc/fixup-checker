package main

import (
	"fmt"
	"github.com/labstack/echo"
	"net/http"
	"os"
)

func main() {
	fmt.Println("vim-go")

	e := echo.New()

	e.POST("/check", func(c echo.Context) error {
		params, _ := c.FormParams()
		fmt.Println(string(params.Get("payload")))
		return c.String(http.StatusOK, "OK")
	})

	e.Logger.Debug(e.Start("0.0.0.0:" + os.Getenv("PORT")))
}
