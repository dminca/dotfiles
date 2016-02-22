#!/usr/bin/env bats

@test "Check if we have a Torrentz directory" {
  run stat $HOME/Downloads/Torrentz
  [ $status = 0 ]
}

@test "Check if Hack font is installed" {
  run stat $HOME/.fonts/truetype/Hack*
  [ $status = 0 ]
}

@test "Check if Hack font zip is removed" {
  run stat $HOME/.fonts/truetype/*.zip
  [ $status = 1 ]
}
