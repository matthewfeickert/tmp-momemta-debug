#!/bin/bash

pushd Tutorials

if [ -d build ];then
  rm -rf build
fi
cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local/venv \
    -S . \
    -B build
cmake build -L
cmake --build build \
    --clean-first \
    --parallel $(($(nproc) - 1))

# Build Matrix Element
pushd TTbar_FullyLeptonic
cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local/venv \
    -S MatrixElement \
    -B MatrixElement/build
cmake MatrixElement/build -L
cmake --build MatrixElement/build \
    --clean-first \
    --parallel $(($(nproc) - 1))
popd

pushd build
lhapdf get CT10nlo
./TTbar_FullyLeptonic/TTbar_FullyLeptonic.exe
