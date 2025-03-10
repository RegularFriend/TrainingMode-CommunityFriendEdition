cmake_minimum_required(VERSION 3.16)
project(TrainingModeCommunityEdition C CXX ASM)

# Gather source files for indexing
file(GLOB_RECURSE SRC_FILES
    "${CMAKE_SOURCE_DIR}/src/*.c"
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/src/*.S"
    "${CMAKE_SOURCE_DIR}/ASM/*.asm"
    "${CMAKE_SOURCE_DIR}/ASM/*.s"
)

# Create a dummy target just so CLion can parse the code
add_executable(minimal ${SRC_FILES})
