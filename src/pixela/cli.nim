##[ Reference CLI implements for local development and shorthand

This module is CLI of reference implement to call some API endpoint.

- All consts, types and procs are private. Don't import from outside.
- Error handling is not implemented.
]##
import os
import parseopt
import strutils
import "./client"


type
  Arguments = ref object
    username: string
    token: string


proc parseArguments(args: var Arguments, cmdLine: string) =
  ## Parse command-line and inject arguments
  var p = initOptParser(cmdLine)
  while true:
    p.next()
    case p.kind:
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
      case p.key:
      of "user", "u": args.username = p.val
      of "token", "t": args.token = p.val
    of cmdArgument: discard


when isMainModule:
  var args = Arguments()
  args.parseArguments(commandLineParams().join(" "))
  let apiClient = newClient(args.username, args.token)
  echo(apiClient.username)
  echo(apiClient.token)
