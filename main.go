package main

import (
	"encoding/json"
	"fmt"
	"github.com/labstack/echo"
	"net/http"
	"os"
)

func main() {
	fmt.Println("Drivers!! START YOUR ENGINE!!!")

	e := echo.New()

	e.POST("/check", func(c echo.Context) error {
		params, _ := c.FormParams()
		var payload interface{}
		json.Unmarshal([]byte(params.Get("payload")), &payload)

		action := payload.(map[string]interface{})["action"]
		if action != nil && action.(string) == "synchronize" {
			fmt.Println(params.Get("payload"))
		}

		return c.String(http.StatusOK, "OK")
	})

	e.Logger.Debug(e.Start("0.0.0.0:" + os.Getenv("PORT")))
}
