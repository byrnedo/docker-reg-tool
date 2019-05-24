#!/usr/bin/env bats

@test "list" {
  run ./docker_reg_tool http://localhost:5000 list
  [ "$output" = "hello-world" ]
}

@test "list REPO" {
  run ./docker_reg_tool http://localhost:5000 list hello-world
  [ "$output" = "latest" ]
}

@test "list REPO TAG" {
  run ./docker_reg_tool http://localhost:5000 list hello-world latest
  [ "$output" = "hello-world" ]
}
