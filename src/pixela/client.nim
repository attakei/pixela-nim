## Module for Pixela httpclient
import httpclient


const
  API_URL_BASE* = "https://pixe.la/v1"
    ## Endpoint URL base


type
  Client* = ref object
    ##[ Client request struct.

    Manage elements required by any APIs.
    ]##
    username*: string
    token*: string

  ResponseBody* = ref object
    ## Generic response content from Pixela.
    isSuccess*: bool
    message*: string


proc newClient*(username: string, token: string): Client =
  result = Client(username: username, token: token)


proc createRequestHeaders*(self: Client): HttpHeaders =
  result = newHttpHeaders()
  result["X-USER-TOKEN"] = self.token
