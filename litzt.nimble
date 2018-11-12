# Package

version       = "0.1.0"
author        = "brianketelsen"
description   = "Tagged template literal web app lib"
license       = "MIT"
bin           = @["litzt.js"]
binDir        = "bin"
installExt    = @["nim"]
srcDir        = "src"
backend       = "js"

# Dependencies

requires "nim >= 0.18.1"
requires "litz >= 0.1.0"


task test, "run litz tests":
  withDir "tests":
    exec "nim js test_hello_world.nim"
    exec "node runner.js"

task dtest, "run litz tests w/ nes debug flag on":
  withDir "tests":
    exec "nim js -d:debugNES test_hello_world.nim"
    exec "node runner.js"