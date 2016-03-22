#!/usr/bin/env bats
SCRIPT="./init"

# -----------------------------------------------------------------
# TEST BATS
# -----------------------------------------------------------------
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

# -----------------------------------------------------------------
# INIT SCRIPT TESTS
# -----------------------------------------------------------------
@test "Check if packages are installed via installPkgs" {
  run $SCRIPT installPkgs
  [ $status = 0 ]
}

@test "Check if WireShark is successfully installed" {
  run $SCRIPT installWireshark
  [ $status = 0 ]
}

@test "Check if the memory cleanup if done properly" {
  run $SCRIPT cleanup_memory
  [ $status = 0 ]
}
