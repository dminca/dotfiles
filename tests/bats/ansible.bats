#!/usr/bin/env bats
source "vars.env"

@test "Check if Ansible is properly installed" {
  skip run $SCRIPT installAnsible
  run bash -c "which ansible > /dev/null 2>&1"
  [ $status -eq 0 ]
}