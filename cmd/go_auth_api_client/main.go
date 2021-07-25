package main

import (
	"context"
	"fmt"
	client "github.com/bebo-dot-dev/go-auth-api-v2/client"
	"os"
)

func main() {

	configuration := client.NewConfiguration()
	apiClient := client.NewAPIClient(configuration)
	resp, r, err := apiClient.AuthAPIApi.Ping(context.Background()).Execute()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error when calling `AuthAPIApi.Ping``: %v\n", err)
		fmt.Fprintf(os.Stderr, "Full HTTP response: %v\n", r)
	}
	// response from `Ping`: PingResponse
	fmt.Fprintf(os.Stdout, "Response from `AuthAPIApi.Ping`: %v\n", resp)
}
