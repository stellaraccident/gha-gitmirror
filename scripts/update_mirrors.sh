#!/bin/bash

td="$(cd $(dirname $0)/.. && pwd)"
command="$1"

function init() {
  local path="$1"
  local url="https://$path"
  local clone_dir="$td/mirrors/$path"
  echo "Initializing mirror $url into $clone_dir"
  mkdir -p "$(dirname $clone_dir)"
  git clone --mirror "$url" "$clone_dir"
}

function update() {
  local path="$1"
  local clone_dir="$td/mirrors/$path"
  echo "Updating $clone_dir from remote"
  cd $clone_dir
  git remote update
}

function handle() {
  local path="$1"
  if [[ "$command" == "init" ]]; then
    init $1
  elif [[ "$command" == "update" ]]; then
    update $1
  else
    echo "ERROR: Expected 'init' or 'update"
    exit 1
  fi
}

handle github.com/openxla/iree.git
handle github.com/google/googletest.git
handle github.com/shark-infra/llvm-project.git
handle github.com/KhronosGroup/Vulkan-Headers.git
handle github.com/pybind/pybind11.git
handle github.com/google/benchmark.git
handle github.com/wolfpld/tracy.git
handle github.com/dvidelabs/flatcc.git
handle github.com/KhronosGroup/SPIRV-Cross.git
handle github.com/pytorch/cpuinfo.git
handle github.com/yaml/libyaml.git
handle github.com/webgpu-native/webgpu-headers.git
handle github.com/powderluv/musl.git
handle github.com/shark-infra/stablehlo.git
handle github.com/shark-infra/torch-mlir.git
handle github.com/shark-infra/hip-build-deps.git

# AIE repos.
handle github.com/Xilinx/XRT.git
handle github.com/nod-ai/mlir-aie.git
handle github.com/nod-ai/mlir-air.git

