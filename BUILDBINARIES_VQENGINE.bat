:: This is an example file to generate binaries using Windows Operating System
:: This script is configured to be executed from the source directory

:: Compiled binaries will be placed in BINARIES_DIR\code\CONFIG

:: NOTE
:: The build process will generate a config.h file that is placed in BINARIES_DIR\include
:: This file must be merged with SOURCE_DIR\include
:: You should write yourself a script that copies the files where you want them.
:: Also see: https://github.com/assimp/assimp/pull/2646
setlocal enabledelayedexpansion
SET SOURCE_DIR=./assimp/
SET GENERATOR=Visual Studio 17 2022

SET BINARIES_DIR="./build/x64"

:: importers
set ASSIMP_IMPORT_FORMATS=-DASSIMP_BUILD_OBJ_IMPORTER=TRUE
set ASSIMP_IMPORT_FORMATS=!ASSIMP_IMPORT_FORMATS! -DASSIMP_BUILD_GLTF_IMPORTER=TRUE
:: build options
set CMAKE_ASSIMP_PARAMETERS=-DASSIMP_BUILD_ASSIMP_TOOLS=OFF
set CMAKE_ASSIMP_PARAMETERS=!CMAKE_ASSIMP_PARAMETERS! -DASSIMP_NO_EXPORT=ON 
set CMAKE_ASSIMP_PARAMETERS=!CMAKE_ASSIMP_PARAMETERS! -DASSIMP_BUILD_ALL_IMPORTERS_BY_DEFAULT=OFF
set CMAKE_ASSIMP_PARAMETERS=!CMAKE_ASSIMP_PARAMETERS! -DBUILD_SHARED_LIBS=OFF 
set CMAKE_ASSIMP_PARAMETERS=!CMAKE_ASSIMP_PARAMETERS! -DASSIMP_BUILD_TESTS=OFF 
set CMAKE_ASSIMP_PARAMETERS=!CMAKE_ASSIMP_PARAMETERS! -DASSIMP_INSTALL=OFF
set CMAKE_ASSIMP_PARAMETERS=!CMAKE_ASSIMP_PARAMETERS! !ASSIMP_IMPORT_FORMATS!



cmake . -G "%GENERATOR%" -A x64 -S %SOURCE_DIR% -B %BINARIES_DIR% %CMAKE_ASSIMP_PARAMETERS%
cmake --build %BINARIES_DIR% --config debug
cmake --build %BINARIES_DIR% --config release
