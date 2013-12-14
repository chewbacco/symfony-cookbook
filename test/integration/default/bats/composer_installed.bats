#!/usr/bin/env bats

@test "composer binary is found in PATH" {
  run which composer
  [ "$status" -eq 0 ]
}