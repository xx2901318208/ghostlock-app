@echo off
set NDK=C:\android-ndk-r29
set CC=%NDK%\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android35-clang.cmd
set AR=%NDK%\toolchains\llvm\prebuilt\windows-x86_64\bin\llvm-ar.exe
set CC_aarch64_linux_android=%CC%
set AR_aarch64_linux_android=%AR%
set CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=%CC%
cargo build --release --target aarch64-linux-android --manifest-path tools\extract_rs\Cargo.toml
if errorlevel 1 (
    echo EXTRACT BUILD FAILED
    exit /b 1
)
echo EXTRACT BUILD SUCCESS
