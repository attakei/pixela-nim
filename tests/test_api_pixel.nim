import json
import options
import times
import unittest
import "pixela/api/pixel_post"


suite "Input types":
  test "PixelCreateInput.json":
    var input = PixelCreateInput[int]()
    input.date = now()
    input.quantity = 1
    check input.toJson["quantity"].getStr() == "1"
    check not input.toJson.hasKey("optionalData")

  test "PixelCreateInput.json(with optionalData)":
    var input = PixelCreateInput[int]()
    input.date = now()
    input.quantity = 1
    input.optionalData = some(newJObject())
    check input.toJson["quantity"].getStr() == "1"
    check input.toJson["optionalData"].getStr() == "{}"

  test "PixelCreateInput.json(float)":
    var input = PixelCreateInput[float]()
    input.date = now()
    input.quantity = 1.1
    check input.toJson["quantity"].getStr() == "1.1"

