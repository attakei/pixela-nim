## Implement for POST request for Pixel APIs.
import json
import options
import times


const DATE_FORMAT = initTimeFormat("yyyyMMdd")


type
  PixelCreateInput*[T: SomeNumber] = ref object
    ##[ Component of request body in Pixel POST.

    See: `https://docs.pixe.la/entry/post-pixel`_
    ]##
    date*: DateTime
    quantity*: T
    optionalData*: Option[JsonNode]


proc toJson*(self: PixelCreateInput): JsonNode =
  ## Convert to acceptable json object format (not string)
  result = newJObject()
  result.add("date", newJString(self.date.format(DATE_FORMAT)))
  result.add("quantity", newJString($self.quantity))
  if self.optionalData.isSome:
    result.add("optionalData", newJString($self.optionalData.get()))
