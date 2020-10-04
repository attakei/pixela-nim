## Implement fir POST request for Graph APIs.
import httpclient
import json
import "../client"


type
  GraphCreation* = ref object
    ## Graph definition for create
    id*: string
    name*: string
    unit*: string
    utype*: string
    color*: string
    timezone*: string
    selfSufficient*: string
    isSecret*: bool
    publishOptionalData*: bool


proc newGraphCreation*(data: JsonNode): GraphCreation =
  data.add("utype", data["type"])
  data.delete("type")
  if not data.hasKey("timezone"):
    data.add("timezone", newJString("UTC"))
  if not data.hasKey("selfSufficient"):
    data.add("selfSufficient", newJString("none"))
  if not data.hasKey("isSecret"):
    data.add("isSecret", newJBool(false))
  if not data.hasKey("publishOptionalData"):
    data.add("publishOptionalData", newJBool(false))
  result = to(data, GraphCreation)


proc toJson*(self: GraphCreation): JsonNode =
  result = %*self
  result.add("type", result["utype"])
  result.delete("utype")


proc postGraph*(self: Client, body: GraphCreation): ResponseBody =
  ## Create new graph in Pixela by definition.
  let httpClient = newHttpClient()
  httpClient.headers = self.createRequestHeaders()
  let url = API_URL_BASE & "/users/" & self.username & "/graphs/"
  let resp = httpClient.request(url, HttpPost, $body.toJson)
  result = to(parseJson(resp.body), ResponseBody)
