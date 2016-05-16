#!/usr/bin/env bats
source "vars.env"

@test "Check if KeeWeb is successfully installed" {
  run $SCRIPT installKeeWeb
  run bash -c "which KeeWeb > /dev/null 2>&1"
  [ $status -eq 0 ]
}
