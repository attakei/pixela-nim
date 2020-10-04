##[ Reference CLI implements for local development and shorthand

This module is CLI of reference implement to call some API endpoint.

- All consts, types and procs are private. Don't import from outside.
- Error handling is not implemented.
]##
import json
import os
import parseopt
import strutils
import "./api/graph_create"
import "./api/graph_delete"
import "./api/graph_get"
import "./client"


type
  Arguments = ref object
    username: string
    token: string
    command: string
    graphId: string
    src: string


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
      of "src", "s": args.src = p.val
      of "graph", "g": args.graphId = p.val
    of cmdArgument:
      if args.command == "":
        args.command = p.key


when isMainModule:
  var args = Arguments()
  args.parseArguments(commandLineParams().join(" "))
  let apiClient = newClient(args.username, args.token)
  case args.command:
  of "graph:list":
    for g in apiClient.getGraphs():
      echo(g.id)
  of "graph:create":
    let body = newGraphCreation(parseJson(readAll(open(args.src))))
    let resp = apiClient.postGraph(body)
    echo(resp.message)
  of "graph:delete":
    let resp = apiClient.deleteGraph(args.graphId)
    echo(resp.message)
  else:
    echo("Command not found")
