## Module for Pixela httpclient
import httpclient


type
  Client* = ref object
    ##[ Client request struct.

    Manage elements required by any APIs.
    ]##
    username*: string
    token*: string


proc newClient*(username: string, token: string): Client =
  result = Client(username: username, token: token)


proc createRequestHeaders*(self: Client): HttpHeaders =
  result = newHttpHeaders()
  result["X-USER-TOKEN"] = self.token
