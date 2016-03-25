#!/usr/bin/env bats
source "vars.env"

@test "Check if the Paper theme is properly installed" {
  run $SCRIPT themePaper
  run bash -c "apt-cache show paper-gtk-theme > /dev/null 2>&1"
  [ $status -eq 0 ]
}