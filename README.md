#Various Toolchains and Tools for Embedded Development

## Getting Started ##

	brew tap darconeous/embedded

### Code Sourcery ARM Toolchain 2008q3 (arm-none-eabi) ###

	brew install arm-2008q3-gcc

### AVR ###

	brew install avr-gcc
	brew install avr-gdb
	brew install avrdude         # For general-purpose AVR programming.
	brew install dfu-programmer  # For programming AVR USB chips.
	brew install avarice         # For using GDB.