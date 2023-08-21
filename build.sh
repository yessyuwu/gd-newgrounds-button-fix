# https://gist.github.com/matcool/abb65ee59ded3766717c673014c3a2a7
# remember to actually set these..
export SPLAT_DIR=$HOME/windows/splat
export TOOLCHAIN_REPO=$HOME/windows/toolchain

export HOST_ARCH=x86
export MSVC_BASE=$SPLAT_DIR/crt
export WINSDK_BASE=$SPLAT_DIR/sdk
# TODO: get this from the thing..
export WINSDK_VER=10.0.22000
# change this to your llvm version!!!
export LLVM_VER=15
export CLANG_VER=$LLVM_VER

# you can also use `-G Ninja` here
cmake \
  -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_REPO/clang-cl-msvc.cmake \
  -DCMAKE_BUILD_TYPE=Release -B build \
  -DGEODE_DISABLE_FMT_CONSTEVAL=1 \
  -G Ninja
  
cmake --build build --config Release
