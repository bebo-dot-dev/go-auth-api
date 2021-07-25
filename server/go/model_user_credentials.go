/*
 * User API
 *
 * An API for creating and authenticating system users
 *
 * API version: 0.1.0
 * Contact: joe@bebo.dev
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package goauthapi

import "github.com/go-playground/validator"

type UserCredentials struct {
	Username string `json:"username" validate:"required"`

	Password string `json:"password" validate:"required"`
}

func (u *UserCredentials) Validate() error {
	validate := validator.New()
	return validate.Struct(u)
}
