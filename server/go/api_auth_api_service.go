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

import (
	"context"
	"net/http"
	"errors"
)

// AuthAPIApiService is a service that implents the logic for the AuthAPIApiServicer
// This service should implement the business logic for every endpoint for the AuthAPIApi API. 
// Include any external packages or services that will be required by this service.
type AuthAPIApiService struct {
}

// NewAuthAPIApiService creates a default api service
func NewAuthAPIApiService() AuthAPIApiServicer {
	return &AuthAPIApiService{}
}

// AddAccount - adds a new account
func (s *AuthAPIApiService) AddAccount(ctx context.Context, userAccountDetails UserAccountDetails) (ImplResponse, error) {
	// TODO - update AddAccount with the required logic for this service method.
	// Add api_auth_api_service.go to the .openapi-generator-ignore to avoid overwriting this service implementation when updating open api generation.

	//TODO: Uncomment the next line to return response Response(201, NewUserAccount{}) or use other options such as http.Ok ...
	//return Response(201, NewUserAccount{}), nil

	//TODO: Uncomment the next line to return response Response(400, {}) or use other options such as http.Ok ...
	//return Response(400, nil),nil

	//TODO: Uncomment the next line to return response Response(409, {}) or use other options such as http.Ok ...
	//return Response(409, nil),nil

	return Response(http.StatusNotImplemented, nil), errors.New("AddAccount method not implemented")
}

// AuthenticateUser - authenticates an existing user
func (s *AuthAPIApiService) AuthenticateUser(ctx context.Context, userCredentials UserCredentials) (ImplResponse, error) {
	// TODO - update AuthenticateUser with the required logic for this service method.
	// Add api_auth_api_service.go to the .openapi-generator-ignore to avoid overwriting this service implementation when updating open api generation.

	//TODO: Uncomment the next line to return response Response(202, ExistingUserAccount{}) or use other options such as http.Ok ...
	//return Response(202, ExistingUserAccount{}), nil

	//TODO: Uncomment the next line to return response Response(400, {}) or use other options such as http.Ok ...
	//return Response(400, nil),nil

	//TODO: Uncomment the next line to return response Response(401, {}) or use other options such as http.Ok ...
	//return Response(401, nil),nil

	return Response(http.StatusNotImplemented, nil), errors.New("AuthenticateUser method not implemented")
}

// Ping - tests this api
func (s *AuthAPIApiService) Ping(ctx context.Context) (ImplResponse, error) {
	// TODO - update Ping with the required logic for this service method.
	// Add api_auth_api_service.go to the .openapi-generator-ignore to avoid overwriting this service implementation when updating open api generation.

	//TODO: Uncomment the next line to return response Response(201, PingResponse{}) or use other options such as http.Ok ...
	//return Response(201, PingResponse{}), nil

	return Response(http.StatusNotImplemented, nil), errors.New("Ping method not implemented")
}

