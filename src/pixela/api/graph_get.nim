## Implement fir GET request for Graph APIs.
import httpclient
import json
import options
import sequtils
import "../client"


type
  GraphDefinition* = ref object
    ## Graph content
    id*: string
    name*: string
    unit*: string
    utype*: string
    color*: string
    timezone*: string
    purgeCacheURLs*: Option[seq[string]]
    selfSufficient*: string
    isSecret*: bool
    publishOptionalData*: bool


proc fromJson*(data: JsonNode): GraphDefinition =
  # let utype = data["type"].getStr()
  data.add("utype", data["type"])
  data.delete("type")
  result = to(data, GraphDefinition)


proc toJson*(self: GraphDefinition): JsonNode =
  result = %*self
  result.add("type", result["utype"])
  result.delete("utype")


proc getGraphs*(self: Client): seq[GraphDefinition] =
  ## Fetch list of graph definition from Pixela.
  let httpClient = newHttpClient()
  httpClient.headers = self.createRequestHeaders()
  let url = API_URL_BASE & "/users/" & self.username & "/graphs/"
  let resp = httpClient.request(url, HttpGet)
  let data = parseJson(resp.body)
  result = data["graphs"].mapIt(fromJson(it))
