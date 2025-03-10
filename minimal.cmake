# Tell CMake we're cross-compiling for a generic PowerPC system
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR powerpc)

# Prevent "try_compile" from building a Windows .exe; just build a static library instead
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Point to the devkitPPC cross compilers
set(CMAKE_C_COMPILER "C:/devkitPro/devkitPPC/bin/powerpc-eabi-gcc.exe")
set(CMAKE_CXX_COMPILER "C:/devkitPro/devkitPPC/bin/powerpc-eabi-g++.exe")

# Remove Windows-specific link flags
set(CMAKE_C_LINK_EXECUTABLE
        "<CMAKE_C_COMPILER> <FLAGS> <OBJECTS> -o <TARGET> <LINK_FLAGS>"
)
set(CMAKE_CXX_LINK_EXECUTABLE
        "<CMAKE_CXX_COMPILER> <FLAGS> <OBJECTS> -o <TARGET> <LINK_FLAGS>"
)

# Include devkitPro/libogc headers (adjust path as needed)
include_directories("C:/devkitPro/libogc/include")

# Example compiler flags for GameCube
set(CMAKE_C_FLAGS "-mcpu=750 -meabi -mhard-float -O2")
set(CMAKE_CXX_FLAGS "-mcpu=750 -meabi -mhard-float -O2")
