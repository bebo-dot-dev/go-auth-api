/*
 * User API
 *
 * An API for creating and authenticating system users
 *
 * API version: 0.1.0
 * Contact: joe@bebo.dev
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package main

import (
	goauthapi "github.com/bebo-dot-dev/go-auth-api/go"
	"github.com/gorilla/handlers"
	"log"
	"net/http"
)

func main() {
	log.Printf("Server started")

	AuthAPIApiService := goauthapi.NewAuthAPIApiService()
	AuthAPIApiController := goauthapi.NewAuthAPIApiController(AuthAPIApiService)

	router := goauthapi.NewRouter(AuthAPIApiController)

	corsOrigins := handlers.AllowedOrigins([]string{"https://editor.swagger.io"})
	corsHeaders := handlers.AllowedHeaders([]string{"X-Requested-With", "Content-Type", "Authorization"})
	corsMethods := handlers.AllowedMethods([]string{"GET", "POST", "PUT", "HEAD", "OPTIONS"})
	log.Fatal(http.ListenAndServe(":8080", handlers.CORS(corsOrigins, corsHeaders, corsMethods)(router)))
}
