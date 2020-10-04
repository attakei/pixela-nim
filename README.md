# pixela for nim

Pixela client library for Nim.

## (Install)

Currently, this is not registered in nimble-directory.

Clone this and register at local.

```bash
$ git clone https://github.com/attakei-sandbox/pixela-nim.git
$ cd pixela-nim
$ nimble develop
```

## Usage

(Planning)

```nim
import pixela

when isMainModule:
  let api = newApiClient("username", "your-token")
  # Post quantity to your graph as today metric
  api.postGraph("your-graph", 1)
```

## Goal

Final goal is to handle all APIs of Pixela with Nim programming.

Steps:

- [ ] Implement features of APIs to use by me
- [ ] Implement features of all APIs that return JSON content
- [ ] Implement features of all APIs others
