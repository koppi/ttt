cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

project(ttt VERSION 0.0.1 LANGUAGES C)

file(GLOB_RECURSE sources *.c *.h)

add_executable(${PROJECT_NAME} ${sources})

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
