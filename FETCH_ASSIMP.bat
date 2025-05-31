@echo off
setlocal enabledelayedexpansion

if not exist "assimp" (
    git clone https://github.com/assimp/assimp.git
) else (
    cd assimp
    git clean -fdfx ./
    git checkout -- .
    git pull
)


