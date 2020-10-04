## Implement fir DELETE request for Graph APIs.
import httpclient
import json
import "../client"


proc deleteGraph*(self: Client, graphId: string): ResponseBody =
  ## Delete graph of Pixela.
  let httpClient = newHttpClient()
  httpClient.headers = self.createRequestHeaders()
  let url = API_URL_BASE & "/users/" & self.username & "/graphs/" & graphId
  let resp = httpClient.request(url, HttpDelete)
  result = to(parseJson(resp.body), ResponseBody)
