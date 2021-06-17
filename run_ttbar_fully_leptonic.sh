#!/bin/bash

pushd ttbar_fully_leptonic_example


# Build Matrix Element
pushd momemta

if [ -d MatrixElements/pp_ttx_fully_leptonic/build ];then
    rm -rf MatrixElements/pp_ttx_fully_leptonic/build
fi

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local/venv \
    -S MatrixElements/pp_ttx_fully_leptonic \
    -B MatrixElements/pp_ttx_fully_leptonic/build
cmake MatrixElements/pp_ttx_fully_leptonic/build -L
cmake --build MatrixElements/pp_ttx_fully_leptonic/build \
    --clean-first \
    --parallel $(($(nproc) - 1))
popd

# Example level build
popd
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

ls -lhtra build/momemta/
# pushd build
# ./momemta/tt_fullyleptonic.exe
