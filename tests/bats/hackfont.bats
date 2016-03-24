#!/usr/bin/env bats
source vars

@test "Check if Hack font is installed" {
  run ls $HOME/.fonts/truetype/Hack*
  run bash -c "test -e $HOME/.fonts/truetype/Hack-Regular.ttf > /dev/null 2>&1"
  [ $status -eq 0 ]
}