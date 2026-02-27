package main

import (
	"github.com/gofiber/fiber/v3"
	"log"
)

func main() {

	app := fiber.New()

	app.Get("/", func(c fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	app.Post("/echo", func(c fiber.Ctx) error {
		return c.Send(c.Body())
	})

	log.Fatal(app.Listen(":3000"))
}