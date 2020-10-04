import json
import unittest
import "pixela/api/graph_get"


suite "compatible response":
  test "json -> type":
    let body = "{\"id\":\"test-graph\",\"name\":\"graph-name\",\"unit\":\"commit\",\"type\":\"int\",\"color\":\"shibafu\",\"timezone\":\"Asia/Tokyo\",\"purgeCacheURLs\":[\"https://camo.githubusercontent.com/xxx/xxxx\"],\"selfSufficient\":\"increment\",\"isSecret\":false,\"publishOptionalData\":true}"
    let obj = fromJson(parseJson(body))
    check obj.id == "test-graph"
    check obj.utype == "int"

  test "type -> json":
    let obj = GraphDefinition()
    obj.utype = "int"
    let jObj = obj.toJson()
    check "type" in jObj
    check jObj["type"].getStr() == "int"
