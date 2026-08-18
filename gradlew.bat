@echo off
setlocal
set GRADLE_VERSION=8.10.1
set DIST=%USERPROFILE%\.gradle\wrapper\dists\gradle-%GRADLE_VERSION%-bin
set GRADLE_HOME=%DIST%\gradle-%GRADLE_VERSION%
if not exist "%GRADLE_HOME%\bin\gradle.bat" (
  echo Please install Gradle 8.10.1 or use GitHub Actions to bootstrap the build.
  exit /b 1
)
call "%GRADLE_HOME%\bin\gradle.bat" %*
