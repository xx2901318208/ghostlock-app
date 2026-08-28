@echo off
set NDK=C:\android-ndk-r29
set CC=%NDK%\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android35-clang.cmd
%CC% -O2 -flto -Wall -Wno-unused-parameter -Wno-sign-compare -Wno-unused-function -Isrc/core -Isrc/kernels -DTARGET_CONFIG_H=\"target.h\" -fPIE -pie -pthread -flto src/core/main.c src/core/offsets_json.c src/core/util.c src/core/fops.c -o ghostlock
if errorlevel 1 (
    echo BUILD FAILED
    exit /b 1
)
echo BUILD SUCCESS
