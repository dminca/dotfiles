#!/usr/bin/env bats
SCRIPT="./init"


# -----------------------------------------------------------------
# INIT SCRIPT TESTS
# -----------------------------------------------------------------
@test "Check if Adobe is installed" {
  run $SCRIPT installAdobe
  [ $status -eq 0 ]
}

@test "Check if Ansible is properly installed" {
  run $SCRIPT installAnsible
  [ $status -eq 0 ]
}

@test "Check if Chrome is properly installed" {
  run $SCRIPT installChrome
  [ $status -eq 0 ]
}

@test "Check if Docker is installed properly" {
  run $SCRIPT installDocker
  [ $status -eq 0 ]
}

@test "Check if dotfiles are sucessfully pulled" {
  run $SCRIPT installDotfiles
  [ $status -eq 0 ]
}

@test "Check if Dropbox is successfully installed" {
  run $SCRIPT installDropbox
  [ $status -eq 0 ]
}

@test "Check if Hack font is installed" {
  run ls $HOME/.fonts/truetype/Hack*
  [ $status -eq 0 ]
}

@test "Check if Hack font zip is removed" {
  run ls $HOME/.fonts/truetype/*.zip
  [ $status -gt 0 ]
}

@test "Check if packages are installed via installPkgs" {
  skip run $SCRIPT installPkgs
  [ $status -eq 0 ]
}

@test "Check if Numix theme is properly installed" {
  run $SCRIPT themeNumix
  [ $status -eq 0 ]
}

@test "Check if the Paper theme is properly installed" {
  run $SCRIPT themePaper
  [ $status -eq 0 ]
}

@test "Check if SublimeText is properly installed" {
  run $SCRIPT installSublime
  [ $status -eq 0 ]
}

@test "Check if tasksh is successfully installed" {
  run $SCRIPT installTask
  [ $status -eq 0 ]
}

@test "Check if the memory cleanup if done properly" {
  run $SCRIPT cleanup_memory
  [ $status -eq 0 ]
}

@test "Check if Vim is successfully configured" {
  run $SCRIPT installVim
  [ $status -eq 0 ]
}

@test "Check if WireShark is successfully installed" {
  run $SCRIPT installWireshark
  [ $status -eq 0 ]
}

@test "Check if installation junk is cleared" {
  run $SCRIPT clearInstall
  [ $status -eq 0 ]
}

@test "Check if ZSH is properly installed" {
  run $SCRIPT installZsh
  [ $status -eq 0 ]
}