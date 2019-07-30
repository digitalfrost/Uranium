echo Prepare envrionment variables ...
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
set PATH=C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin;%PATH%
set PATH=%CURA_BUILD_ENV_PATH%\bin;%PATH%

cd C:\git-repo
mkdir build
cd build
cmake ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="${CURA_BUILD_ENV_PATH}" ^
    -G "NMake Makefiles" ^
    ..
nmake
ctest --output-on-failure -T Test
