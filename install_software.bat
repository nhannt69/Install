@echo off
setlocal

:: Set installation directory for Anaconda
set ANACONDA_INSTALL_DIR=C:\Anaconda3

:: Define download URLs and installer names
set "CHROME_URL=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
set "CHROME_INSTALLER=chrome_installer.exe"
set "GITHUB_URL=https://desktop.github.com/latest"
set "GITHUB_INSTALLER=github_desktop_installer.exe"
set "GIT_URL=https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/Git-2.41.0-64-bit.exe"
set "GIT_INSTALLER=git_installer.exe"
set "VS_CODE_URL=https://code.visualstudio.com/sha/download?build=stable&os=win32-x64"
set "VS_CODE_INSTALLER=vscode_installer.exe"
set "SEVEN_ZIP_URL=https://www.7-zip.org/a/7z2201-x64.exe"
set "SEVEN_ZIP_INSTALLER=7zip_installer.exe"
set "ANACONDA_URL=https://repo.anaconda.com/archive/Anaconda3-2023.07-Windows-x86_64.exe"
set "ANACONDA_INSTALLER=anaconda_installer.exe"

:: Download installers
echo Downloading installers...
curl -L -o %CHROME_INSTALLER% %CHROME_URL%
curl -L -o %GITHUB_INSTALLER% %GITHUB_URL%
curl -L -o %GIT_INSTALLER% %GIT_URL%
curl -L -o %VS_CODE_INSTALLER% %VS_CODE_URL%
curl -L -o %SEVEN_ZIP_INSTALLER% %SEVEN_ZIP_URL%
curl -L -o %ANACONDA_INSTALLER% %ANACONDA_URL%

:: Install software
echo Installing Google Chrome...
start /wait %CHROME_INSTALLER% /silent /install

echo Installing GitHub Desktop...
start /wait %GITHUB_INSTALLER% /silent /install

echo Installing Git...
start /wait %GIT_INSTALLER% /VERYSILENT /NORESTART

echo Installing Visual Studio Code...
start /wait %VS_CODE_INSTALLER% /VERYSILENT /NORESTART

echo Installing 7-Zip...
start /wait %SEVEN_ZIP_INSTALLER% /S

echo Installing Anaconda...
start /wait %ANACONDA_INSTALLER% /S /D=%ANACONDA_INSTALL_DIR%

:: Clean up
echo Cleaning up installers...
del %CHROME_INSTALLER%
del %GITHUB_INSTALLER%
del %GIT_INSTALLER%
del %VS_CODE_INSTALLER%
del %SEVEN_ZIP_INSTALLER%
del %ANACONDA_INSTALLER%

:: Optionally add Anaconda to PATH
echo Updating PATH environment variable for Anaconda...
setx PATH "%PATH%;%ANACONDA_INSTALL_DIR%;%ANACONDA_INSTALL_DIR%\Scripts;%ANACONDA_INSTALL_DIR%\Library\bin"

echo Installation complete.
pause

endlocal
