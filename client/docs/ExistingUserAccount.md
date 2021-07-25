# ExistingUserAccount

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Id** | **int32** |  | 
**Authenticated** | **bool** |  | 

## Methods

### NewExistingUserAccount

`func NewExistingUserAccount(id int32, authenticated bool, ) *ExistingUserAccount`

NewExistingUserAccount instantiates a new ExistingUserAccount object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewExistingUserAccountWithDefaults

`func NewExistingUserAccountWithDefaults() *ExistingUserAccount`

NewExistingUserAccountWithDefaults instantiates a new ExistingUserAccount object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetId

`func (o *ExistingUserAccount) GetId() int32`

GetId returns the Id field if non-nil, zero value otherwise.

### GetIdOk

`func (o *ExistingUserAccount) GetIdOk() (*int32, bool)`

GetIdOk returns a tuple with the Id field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetId

`func (o *ExistingUserAccount) SetId(v int32)`

SetId sets Id field to given value.


### GetAuthenticated

`func (o *ExistingUserAccount) GetAuthenticated() bool`

GetAuthenticated returns the Authenticated field if non-nil, zero value otherwise.

### GetAuthenticatedOk

`func (o *ExistingUserAccount) GetAuthenticatedOk() (*bool, bool)`

GetAuthenticatedOk returns a tuple with the Authenticated field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetAuthenticated

`func (o *ExistingUserAccount) SetAuthenticated(v bool)`

SetAuthenticated sets Authenticated field to given value.



[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


