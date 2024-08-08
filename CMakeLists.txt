cmake_minimum_required(VERSION 3.5)

project(RockPaperScissors)

set(CMAKE_C_STANDARD 90)
set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_C_EXTENSIONS OFF)

add_executable(rps
    src/computer.c
    src/main.c
    src/move.c
    src/player.c
)

target_compile_options(rps PRIVATE -Wall -Werror -Wextra -Wpedantic)
