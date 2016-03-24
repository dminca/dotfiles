#!/usr/bin/env bats
source vars

@test "Check if Dropbox is successfully installed" {
  run $SCRIPT installDropbox
  run bash -c "apt-cache show dropbox > /dev/null 2>&1"
  [ $status -eq 0 ]
}