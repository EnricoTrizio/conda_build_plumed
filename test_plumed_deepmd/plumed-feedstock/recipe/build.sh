#!/bin/bash

# save path to libtorch libraries and include (they are saved in a non-standard location)
# find python version
PYTHON_VERSION=`python -c "import sys; print (f'{sys.version_info.major}.{sys.version_info.minor}')"`
export LIBTORCH=${PREFIX}/lib/python${PYTHON_VERSION}/site-packages/torch
export CXXFLAGS="$CXXFLAGS -D_GLIBCXX_USE_CXX11_ABI=0"
export CPPFLAGS="$CPPFLAGS -I${LIBTORCH}/include/torch/csrc/api/include/ -I${LIBTORCH}/include/ -I${LIBTORCH}/include/torch"
export LDFLAGS="$LDFLAGS -L${LIBTORCH}/lib -Wl,-rpath,${LIBTORCH}/lib -Wl,-rpath-link,${LIBTORCH}/lib"

if [[ $(uname) == "Linux" ]]; then
# STATIC_LIBS is a PLUMED specific option and is required on Linux for the following reason:
# When using env modules the dependent libraries can be found through the
# LD_LIBRARY_PATH or encoded configuring with -rpath.
# Conda does not use LD_LIBRARY_PATH and it is thus necessary to suggest where libraries are.
  export STATIC_LIBS=-Wl,-rpath-link,$PREFIX/lib,-rpath-link,${LIBTORCH}/lib#,${LIBTORCH}/lib#
fi

# we also store path so that software linking libplumedWrapper.a knows where libplumedKernel can be found.
export CPPFLAGS="-D__PLUMED_DEFAULT_KERNEL=$PREFIX/lib/libplumedKernel$SHLIB_EXT $CPPFLAGS"

# enable optimization
export CXXFLAGS="${CXXFLAGS//-O2/-O3} -I$INCLUDE"

# disable flags 
#export LDFLAGS="${LDFLAGS//-Wl,--as-needed/}"
#export LDFLAGS="${LDFLAGS//-Wl,-z,relro -Wl,-z,now/}"


# libraries are explicitly listed here due to --disable-libsearch
export LIBS="-lgsl -lgslcblas -lblas -lz -ltorch_cpu -lc10 -ltorch $LIBS"

export CC=mpicc
export CXX=mpic++

# python is disabled since it should be provided as a separate package
# --disable-libsearch forces to link only explicitely requested libraries
# --disable-static-patch avoid tests that are only required for static patches
# --disable-static-archive makes package smaller
#./configure --prefix=$PREFIX --disable-python --disable-libsearch --disable-static-patch --disable-static-archive --enable-modules=all
./configure --prefix=$PREFIX --enable-rpath  --disable-python --disable-static-patch --disable-libsearch --enable-libtorch --enable-modules=+opes+ves+pytorch --enable-mpi --disable-openmp && cat config.log || cat config.log
#./configure --prefix=$PREFIX --enable-rpath  --disable-python --disable-static-patch --disable-libsearch --enable-modules=+opes+ves --enable-mpi --disable-openmp && cat config.log || cat config.log

make -j${CPU_COUNT}
make install

