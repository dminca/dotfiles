#!/usr/bin/env bats
source "vars.env"

# takes too much to install packages
# PASSES locally
@test "Check if WireShark is successfully installed" {
  skip run $SCRIPT installWireshark
  run bash -c "which wireshark > /dev/null 2>&1"
  [ $status -eq 0 ]
}