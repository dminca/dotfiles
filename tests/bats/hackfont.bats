#!/usr/bin/env bats
source "vars.env"

@test "Check if Hack font is installed" {
  run $SCRIPT installFont
  run bash -c "test -e $HOME/.fonts/truetype/Hack-Regular.ttf > /dev/null 2>&1"
  [ $status -eq 0 ]
}