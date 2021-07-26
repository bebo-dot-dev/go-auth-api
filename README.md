# go-auth-api

A postgres database backed Go REST API service for creating and authenticating users

## Overview
This development of this Go service was bootstrapped in an API design first way with the initial creation of this Open API Specification document: [go-auth-api.yaml](https://github.com/bebo-dot-dev/go-auth-api/blob/main/oas_spec_definition/go-auth-api.yaml)

Change commits applied to the [oas spec yaml](https://github.com/bebo-dot-dev/go-auth-api/blob/main/oas_spec_definition/go-auth-api.yaml) file result in automated code generation of Go API server and API client code in this repository.

See [server](https://github.com/bebo-dot-dev/go-auth-api/tree/main/server) and [client](https://github.com/bebo-dot-dev/go-auth-api/tree/main/client) for details.

There is a proof of concept Go fyne UI toolkit application that talks to this API service here: https://github.com/bebo-dot-dev/go-auth-fyne
