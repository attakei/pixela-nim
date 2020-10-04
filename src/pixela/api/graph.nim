## Implement of Graph APIs
import json
import options


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
