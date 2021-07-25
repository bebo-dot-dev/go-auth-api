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

type ExistingUserAccount struct {
	Id int32 `json:"id"`

	Authenticated bool `json:"authenticated"`
}
