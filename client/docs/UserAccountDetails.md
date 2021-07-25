# UserAccountDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**AccountType** | **int32** |  | 
**Username** | **string** |  | 
**Password** | **string** |  | 

## Methods

### NewUserAccountDetails

`func NewUserAccountDetails(accountType int32, username string, password string, ) *UserAccountDetails`

NewUserAccountDetails instantiates a new UserAccountDetails object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewUserAccountDetailsWithDefaults

`func NewUserAccountDetailsWithDefaults() *UserAccountDetails`

NewUserAccountDetailsWithDefaults instantiates a new UserAccountDetails object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetAccountType

`func (o *UserAccountDetails) GetAccountType() int32`

GetAccountType returns the AccountType field if non-nil, zero value otherwise.

### GetAccountTypeOk

`func (o *UserAccountDetails) GetAccountTypeOk() (*int32, bool)`

GetAccountTypeOk returns a tuple with the AccountType field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetAccountType

`func (o *UserAccountDetails) SetAccountType(v int32)`

SetAccountType sets AccountType field to given value.


### GetUsername

`func (o *UserAccountDetails) GetUsername() string`

GetUsername returns the Username field if non-nil, zero value otherwise.

### GetUsernameOk

`func (o *UserAccountDetails) GetUsernameOk() (*string, bool)`

GetUsernameOk returns a tuple with the Username field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetUsername

`func (o *UserAccountDetails) SetUsername(v string)`

SetUsername sets Username field to given value.


### GetPassword

`func (o *UserAccountDetails) GetPassword() string`

GetPassword returns the Password field if non-nil, zero value otherwise.

### GetPasswordOk

`func (o *UserAccountDetails) GetPasswordOk() (*string, bool)`

GetPasswordOk returns a tuple with the Password field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetPassword

`func (o *UserAccountDetails) SetPassword(v string)`

SetPassword sets Password field to given value.



[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


