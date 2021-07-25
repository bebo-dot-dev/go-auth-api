# \AuthAPIApi

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddAccount**](AuthAPIApi.md#AddAccount) | **Put** /addAccount | adds a new account
[**AuthenticateUser**](AuthAPIApi.md#AuthenticateUser) | **Post** /authenticate | authenticates an existing user
[**Ping**](AuthAPIApi.md#Ping) | **Get** /ping | tests this api



## AddAccount

> NewUserAccount AddAccount(ctx).UserAccountDetails(userAccountDetails).Execute()

adds a new account



### Example

```go
package main

import (
    "context"
    "fmt"
    "os"
    openapiclient "./openapi"
)

func main() {
    userAccountDetails := *openapiclient.NewUserAccountDetails(int32(1), "joe", "password") // UserAccountDetails | the user account to add (optional)

    configuration := openapiclient.NewConfiguration()
    api_client := openapiclient.NewAPIClient(configuration)
    resp, r, err := api_client.AuthAPIApi.AddAccount(context.Background()).UserAccountDetails(userAccountDetails).Execute()
    if err != nil {
        fmt.Fprintf(os.Stderr, "Error when calling `AuthAPIApi.AddAccount``: %v\n", err)
        fmt.Fprintf(os.Stderr, "Full HTTP response: %v\n", r)
    }
    // response from `AddAccount`: NewUserAccount
    fmt.Fprintf(os.Stdout, "Response from `AuthAPIApi.AddAccount`: %v\n", resp)
}
```

### Path Parameters



### Other Parameters

Other parameters are passed through a pointer to a apiAddAccountRequest struct via the builder pattern


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userAccountDetails** | [**UserAccountDetails**](UserAccountDetails.md) | the user account to add | 

### Return type

[**NewUserAccount**](NewUserAccount.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints)
[[Back to Model list]](../README.md#documentation-for-models)
[[Back to README]](../README.md)


## AuthenticateUser

> ExistingUserAccount AuthenticateUser(ctx).UserCredentials(userCredentials).Execute()

authenticates an existing user



### Example

```go
package main

import (
    "context"
    "fmt"
    "os"
    openapiclient "./openapi"
)

func main() {
    userCredentials := *openapiclient.NewUserCredentials("joe", "password") // UserCredentials | the user to authenticate (optional)

    configuration := openapiclient.NewConfiguration()
    api_client := openapiclient.NewAPIClient(configuration)
    resp, r, err := api_client.AuthAPIApi.AuthenticateUser(context.Background()).UserCredentials(userCredentials).Execute()
    if err != nil {
        fmt.Fprintf(os.Stderr, "Error when calling `AuthAPIApi.AuthenticateUser``: %v\n", err)
        fmt.Fprintf(os.Stderr, "Full HTTP response: %v\n", r)
    }
    // response from `AuthenticateUser`: ExistingUserAccount
    fmt.Fprintf(os.Stdout, "Response from `AuthAPIApi.AuthenticateUser`: %v\n", resp)
}
```

### Path Parameters



### Other Parameters

Other parameters are passed through a pointer to a apiAuthenticateUserRequest struct via the builder pattern


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCredentials** | [**UserCredentials**](UserCredentials.md) | the user to authenticate | 

### Return type

[**ExistingUserAccount**](ExistingUserAccount.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints)
[[Back to Model list]](../README.md#documentation-for-models)
[[Back to README]](../README.md)


## Ping

> PingResponse Ping(ctx).Execute()

tests this api



### Example

```go
package main

import (
    "context"
    "fmt"
    "os"
    openapiclient "./openapi"
)

func main() {

    configuration := openapiclient.NewConfiguration()
    api_client := openapiclient.NewAPIClient(configuration)
    resp, r, err := api_client.AuthAPIApi.Ping(context.Background()).Execute()
    if err != nil {
        fmt.Fprintf(os.Stderr, "Error when calling `AuthAPIApi.Ping``: %v\n", err)
        fmt.Fprintf(os.Stderr, "Full HTTP response: %v\n", r)
    }
    // response from `Ping`: PingResponse
    fmt.Fprintf(os.Stdout, "Response from `AuthAPIApi.Ping`: %v\n", resp)
}
```

### Path Parameters

This endpoint does not need any parameter.

### Other Parameters

Other parameters are passed through a pointer to a apiPingRequest struct via the builder pattern


### Return type

[**PingResponse**](PingResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints)
[[Back to Model list]](../README.md#documentation-for-models)
[[Back to README]](../README.md)

