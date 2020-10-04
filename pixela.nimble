# Package

version       = "0.1.0"
author        = "Kazuya Takei"
description   = "Pixela API client library"
license       = "Apache-2.0"
srcDir        = "src"
binDir        = "bin"
bin           = @["pixela/cli/pixelaref"]
skipDirs      = @["pixela/cli"]
installExt    = @["nim"]


# Dependencies

requires "nim >= 1.2.6"
