#!/usr/bin/env bats
source vars

# unable to locate package libxml2
@test "Check if Adobe is installed" {
  skip
  run $SCRIPT installAdobe
  run bash -c "apt-cache show adobereader-enu > /dev/null 2>&1"
  [ $status -eq 0 ]
}