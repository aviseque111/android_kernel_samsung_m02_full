################################################################################
1. How to Build
        - get Toolchain
                From android git server, codesourcery and etc ..
                - gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androidkernel-
        - edit Makefile
                edit "CROSS_COMPILE" to right toolchain path(You downloaded).
                        EX)  CROSS_COMPILE=<android platform directory you download>/android/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androidkernel-
                        EX)  CROSS_COMPILE=/usr/local/toolchain/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androidkernel- // check the location of toolchain
                edit "CLANG" to right path(You downloaded).
                        EX)  CC=<android platform directory you download>/android/prebuilts/clang/host/linux-x86/clang-r383902/bin/clang
                        EX)  CC=/usr/local/toolchain/clang/host/linux-x86/clang-r383902/bin/clang // check the location of toolchain
                edit "CLANG_TRIPLE" to right path(You downloaded).
                        EX)  CLANG_TRIPLE=<android platform directory you download>/android/prebuilts/arm-linux-gnueabi-
                        EX)  CLANG_TRIPLE=/usr/local/toolchain/arm-linux-gnueabi- // check the location of toolchain     
        - to Build
                $ export ANDROID_MAJOR_VERSION=r
                $ export ARCH=arm
                $ make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y a02_defconfig
                $ make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y

2. Output files
        - Kernel : arch/arm/boot/Image.gz
        - module : drivers/*/*.ko

3. How to Clean
        $ make clean
################################################################################
