import httpclient
import unittest
import "pixela/client"


suite "Client":
  test "Create request header":
    let client = newClient("testuser", "user-token")
    let headers = client.createRequestHeaders()
    check headers["X-USER-TOKEN"] == "user-token"
