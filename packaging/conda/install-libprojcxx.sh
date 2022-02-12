export CMAKE_PREFIX_PATH=${CONDA_BUILD_SYSROOT}/usr
export CMAKE_INSTALL_PREFIX=${CONDA_BUILD_SYSROOT}/usr

rm -rf build
mkdir build
cd build
cmake .. -GNinja -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH} -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
ninja
