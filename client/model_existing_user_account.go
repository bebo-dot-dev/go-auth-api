/*
 * User API
 *
 * An API for creating and authenticating system users
 *
 * API version: 0.1.0
 * Contact: joe@bebo.dev
 */

// Code generated by OpenAPI Generator (https://openapi-generator.tech); DO NOT EDIT.

package client

import (
	"encoding/json"
)

// ExistingUserAccount struct for ExistingUserAccount
type ExistingUserAccount struct {
	Id int32 `json:"id"`
	Authenticated bool `json:"authenticated"`
}

// NewExistingUserAccount instantiates a new ExistingUserAccount object
// This constructor will assign default values to properties that have it defined,
// and makes sure properties required by API are set, but the set of arguments
// will change when the set of required properties is changed
func NewExistingUserAccount(id int32, authenticated bool) *ExistingUserAccount {
	this := ExistingUserAccount{}
	this.Id = id
	this.Authenticated = authenticated
	return &this
}

// NewExistingUserAccountWithDefaults instantiates a new ExistingUserAccount object
// This constructor will only assign default values to properties that have it defined,
// but it doesn't guarantee that properties required by API are set
func NewExistingUserAccountWithDefaults() *ExistingUserAccount {
	this := ExistingUserAccount{}
	return &this
}

// GetId returns the Id field value
func (o *ExistingUserAccount) GetId() int32 {
	if o == nil {
		var ret int32
		return ret
	}

	return o.Id
}

// GetIdOk returns a tuple with the Id field value
// and a boolean to check if the value has been set.
func (o *ExistingUserAccount) GetIdOk() (*int32, bool) {
	if o == nil  {
		return nil, false
	}
	return &o.Id, true
}

// SetId sets field value
func (o *ExistingUserAccount) SetId(v int32) {
	o.Id = v
}

// GetAuthenticated returns the Authenticated field value
func (o *ExistingUserAccount) GetAuthenticated() bool {
	if o == nil {
		var ret bool
		return ret
	}

	return o.Authenticated
}

// GetAuthenticatedOk returns a tuple with the Authenticated field value
// and a boolean to check if the value has been set.
func (o *ExistingUserAccount) GetAuthenticatedOk() (*bool, bool) {
	if o == nil  {
		return nil, false
	}
	return &o.Authenticated, true
}

// SetAuthenticated sets field value
func (o *ExistingUserAccount) SetAuthenticated(v bool) {
	o.Authenticated = v
}

func (o ExistingUserAccount) MarshalJSON() ([]byte, error) {
	toSerialize := map[string]interface{}{}
	if true {
		toSerialize["id"] = o.Id
	}
	if true {
		toSerialize["authenticated"] = o.Authenticated
	}
	return json.Marshal(toSerialize)
}

type NullableExistingUserAccount struct {
	value *ExistingUserAccount
	isSet bool
}

func (v NullableExistingUserAccount) Get() *ExistingUserAccount {
	return v.value
}

func (v *NullableExistingUserAccount) Set(val *ExistingUserAccount) {
	v.value = val
	v.isSet = true
}

func (v NullableExistingUserAccount) IsSet() bool {
	return v.isSet
}

func (v *NullableExistingUserAccount) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableExistingUserAccount(val *ExistingUserAccount) *NullableExistingUserAccount {
	return &NullableExistingUserAccount{value: val, isSet: true}
}

func (v NullableExistingUserAccount) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableExistingUserAccount) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}


