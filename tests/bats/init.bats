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

@test "Check if Adobe is installed" {
  run $SCRIPT installAdobe
  [ $status = 0 ]
}

@test "Check if Ansible is properly installed" {
  run $SCRIPT installAnsible
  [ $status = 0 ]
}

@test "Check if Docker is installed properly" {
  run $SCRIPT installDocker
  [ $status = 0 ]
}

@test "Check if Vim is successfully configured" {
  run $SCRIPT installVim
  [ $status = 0 ]
}

@test "Check if tasksh is successfully installed" {
  run $SCRIPT installTask
  [ $status = 0 ]
}

@test "Check if dotfiles are sucessfully pulled" {
  run $SCRIPT installDotfiles
  [ $status = 0 ]
}

@test "Check if Chrome is properly installed" {
  run $SCRIPT installChrome
  [ $status = 0 ]
}

# TODO: refactor installFont
# @test "Check if the Hack font is successfully installed" {
#   run $SCRIPT installFont
#   [ $status = 0 ]
# }

@test "Check if Dropbox is successfully installed" {
  run $SCRIPT installDropbox
  [ $status = 0 ]
}

@test "Check if SublimeText is properly installed" {
  run $SCRIPT installSublime
  [ $status = 0 ]
}

# BUG: archive is pulled & extracted in the repo
# @test "Check if NodeJS is properly installed" {
#   run $SCRIPT installNode
#   [ $status = 0 ]
# }

@test "Check if ZSH is properly installed" {
  run $SCRIPT installZsh
  [ $status = 0 ]
}

@test "Check if the Paper theme is properly installed" {
  run $SCRIPT themePaper
  [ $status = 0 ]
}

@test "Check if Numix theme is properly installed" {
  run $SCRIPT themeNumix
  [ $status = 0 ]
}

@test "Check if installation junk is cleared" {
  run $SCRIPT clearInstall
  [ $status = 0 ]
}
