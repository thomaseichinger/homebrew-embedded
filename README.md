#Various Toolchains and Tools for Embedded Development

## Getting Started ##

Get [Homebrew](http://brew.sh) and check the [dependencies](https://github.com/Homebrew/homebrew/wiki/Installation#requirements).  
Then add this repo by

    brew tap thomaseichinger/embedded

### Code Sourcery ARM Toolchain 2008q3 (arm-none-eabi) ###

    brew install arm-2008q3-binutils
    brew install arm-2008q3-gcc
    
### Linaro ARM Toolchain ###

    brew install arm-none-eabi-binutils
    brew install arm-none-eabi-linaro-gcc
    brew install arm-none-eabi-linaro-gdb

### AVR Toolchain ###

    brew install avr-binutils
    brew install avr-gcc
