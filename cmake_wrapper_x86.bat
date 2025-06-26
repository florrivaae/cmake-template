@echo off

:: Change bat path if necessary
call C:\"Program Files"\"Microsoft Visual Studio"\2022\Community\VC\Auxiliary\Build\vcvarsall.bat x86

if errorlevel 1 (
  echo Failed to set up Visual Studio environment 
  pause
  exit /b 1
)

echo.
echo CALLING COMMAND: cmake
echo.
echo WITH ARGUMENTS: %*
echo.
echo OUTPUT OF THE COMMAND:
echo.
cmake %*