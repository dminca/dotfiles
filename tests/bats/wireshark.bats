#!/usr/bin/env bats
source "vars.env"

@test "Check if WireShark is successfully installed" {
  run $SCRIPT installWireshark
  run bash -c "which wireshark > /dev/null 2>&1"
  [ $status -eq 0 ]
}