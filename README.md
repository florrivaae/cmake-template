# Description

Template project with basic structure and CMake presets (defined in CMakePresets.json) for following compilers:

### 1. Windows:
   * **MSVC** from Visual Studio 2022 (v17.x) <- write exact version
   * **GCC** from MinGW package
   * **Clang** with MSVC backend (using MSVC standard lib)
### 2. Linux:
   * **GCC** - NOT TESTED!!!
   * **Clang** - TODO
### 3. Mac:
   * **Clang** - NOT TESTED!!!

# Requirements

### 1. Windows requirements:

* **CMake 3.20+** (https://cmake.org/download/)
* One of these **IDEs (partly optional, but recommended):**
  *  VSCode with C/C++ Extension Pack
  *  Visual Studio 2022
* **Compiler-Specific Requirements:**

| Compiler                 | Requirements                                                                                                                                                                                       |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **MSVC**                 | Visual Studio 2022 with "Desktop Development with C++" workload<br>MSVC v143 toolset                                                                                                               |
| **MinGW GCC**            | [MinGW GCC 14.2.0](https://github.com/niXman/mingw-builds-binaries/releases/download/14.2.0-rt_v12-rev2/x86_64-14.2.0-release-win32-seh-ucrt-rt_v12-rev2.7z)<br>Add `mingw64\bin` to PATH          |
| **Clang (MSVC backend)** | Visual Studio 2022 with "Desktop Development with C++" workload<br>MSVC v143 toolset<br>[LLVM 20.1.0](https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.0/LLVM-20.1.0-win64.exe) |

### 2. Linux requirements:

Builds were run only on Fedora 40.

* **CMake 3.20+** ```sudo dnf install cmake```
* **build-essentials** ```sudo dnf install gcc gcc-c++ make ninja-build```
* **VSCode with C/C++ Extension Pack**

### 3. Mac requirements:

* **CMake 3.20+** ```brew install cmake```
* **make** ```brew install make```
* **XCode Command Line Tools** ```xcode-select --install```

# How to build and run

### 1. Windows:

#### Using VSCode:

1) Open **VSCode with C/C++ Extension Pack** installed

2) Run **"CMake: Select Configure Preset"** from command palette

3) Choose desired preset (e.g., msvc-x64-debug)

4) Build with **"CMake: Build"** command or **"Tasks:Run Build Task"** command (based on configs in .vscode/tasks.json)

5) Debug in **Run and Debug panel** (based on configs in .vscode/launch.json)

When debugging in VSCode, be sure to **explicitly select configure preset** via "CMake: Select Configure Preset" VSCode command before using launch commands!

#### Using Visual Studio:

1) Open project folder in Visual Studio

2) Select preset from "Configuration" dropdown

3) Build using Build menu

4) Run with F5

#### Using Command Line

```bat
:: configure and generate folders (similar to CMake: Select Configure Preset or CMake: Configure commands in VSCode)
cmake --preset <preset_name>

:: build into generated directories
cmake --build --preset <preset_name>

:: run executable (example)
./build/<preset_name>/cmake_template/cmake_template.exe
```

**For MSVC presets**, use wrapper scripts that set up environment before calling CMake:

```bat
:: configure
./cmake_wrapper_x64.bat --preset msvc-x64-debug

:: build
./cmake_wrapper_x64.bat --build --preset msvc-x64-debug

:: run executable (example)
./build/msvc-x64-debug/cmake_template/cmake_template.exe
```

### 2. Linux

```sh
# configure
cmake --preset <preset_name>

# Build
cmake --build --preset <preset_name>

# Run executable (example)
./build/<preset_name>/cmake_template/cmake_template.exe
```

### 3. Mac

```sh
# Configure
cmake --preset <preset_name>

# Build
cmake --build --preset <preset_name>

# Run executable (example)
./build/<preset_name>/output/app
```

# Project structure

```
.
├── .vscode/               # VSCode configuration
│   ├── launch.json        # Startup configurations
│   ├── tasks.json         # Configure&Build tasks
│   └── settings.json      # Formatting settings
├── apps/                  # Entrypoint source files
│   └── CMakeLists.txt     # CMake configuration for entrypoints
├── build/                 # Build artifacts (gitignored)
├── cmake/                 # Custom CMake modules
├── extern/                # External git submodules
│   └── CMakeLists.txt     # CMake configuration for all submodules
├── include/               # Public headers
│   └── core/              # Public headers for core library
├── res/                   # Misc resources
├── src/                   # Source files
│   ├── core/              # Source files for core library
│   │   ├── include/       # Private headers for core library
│   |   └── CMakeLists.txt # CMake configuration for core lib
│   └── CMakeLists.txt     # CMake configuration for all libs
├── tests/                 # Unit tests
│   └── CMakeLists.txt     # CMake configuration for unit-tests
├── CMakeLists.txt         # Main CMake configuration
├── CMakePresets.json      # Build presets
├── cmake_wrapper_x64.bat  # Windows MSVC environment wrapper
├── cmake_wrapper_x86.bat  # Windows MSVC environment wrapper
└── README.md              # This documentation
```
