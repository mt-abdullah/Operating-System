# 64-bit Operating System Kernel

## Overview
This project is a custom-built 64-bit operating system kernel. It is designed from scratch, focusing on low-level system programming, memory management, task scheduling, and hardware interaction.

## Features
- 64-bit long mode support
- Basic bootloader using GRUB
- Memory management (paging and heap allocation)
- Multitasking support (round-robin scheduling)
- Interrupt handling and exception handling
- Basic file system support
- User-mode and kernel-mode separation

## Prerequisites
- A text editor such as [VS Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/) for creating the build environment
- [Qemu](https://www.qemu.org/) for emulating the operating system
  - Remember to add Qemu to the path so that you can access it from your command line ([Windows instructions here](https://dev.to/whaleshark271/using-qemu-on-windows-10-home-edition-4062))
- GCC Cross Compiler (for x86_64)
- NASM (Assembler)
- GNU Make
- GRUB (for bootloader creation)

## Setup
### 1. Clone the Repository
```sh
git clone https://github.com/mt-abdullah/64bit-os-kernel.git
cd 64bit-os-kernel
```

### 2. Build an Image for the Build Environment
```sh
docker build buildenv -t myos-buildenv
```

### 3. Enter Build Environment
- Linux or MacOS:
  ```sh
  docker run --rm -it -v "$(pwd)":/root/env myos-buildenv
  ```
- Windows (CMD):
  ```sh
  docker run --rm -it -v "%cd%":/root/env myos-buildenv
  ```
- Windows (PowerShell):
  ```sh
  docker run --rm -it -v "${pwd}:/root/env" myos-buildenv
  ```

**Note:** If you are using WSL, msys2, or git bash, use the Linux command. If you encounter an issue with an unshared drive, ensure your Docker daemon has access to the drive where your development environment is located.

## Build the Kernel
```sh
make build-x86_64
```

**Note:** If you are using Qemu, please close it before running this command to prevent errors.

To leave the build environment, enter `exit`.

## Run in QEMU
```sh
qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso
```

If the above command fails, try one of the following:
- Windows: `qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso -L "C:\Program Files\qemu"`
- Linux: `qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso -L /usr/share/qemu/`

Alternatively, you can load the operating system on a USB drive and boot into it when you turn on your computer.

## Cleanup
Remove the build environment image:
```sh
docker rmi myos-buildenv -f
```

## File Structure
```
/
├── boot/               # Bootloader code
├── kernel/             # Kernel source code
├── lib/                # Utility libraries
├── drivers/            # Hardware drivers
├── Makefile            # Build script
└── README.md           # Project documentation
```

## Contributing
Contributions are welcome! Feel free to fork the repository and submit a pull request.


