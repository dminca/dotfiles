#!/usr/bin/env bats
source "vars.env"

@test "Check if WireShark is successfully installed" {
  run $SCRIPT installWireshark
  [ $status -eq 0 ]
}