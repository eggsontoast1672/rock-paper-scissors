cmake_minimum_required(VERSION 3.0)

project(RockPaperScissors)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_C_STANDARD 90)

add_executable(rps
    src/computer.c
    src/main.c
    src/move.c
    src/player.c
)

if(NOT MSVC)
    target_compile_options(rps PRIVATE -Wall -Werror -Wextra -Wpedantic)
endif()
