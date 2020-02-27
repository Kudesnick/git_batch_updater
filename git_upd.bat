:: This script must be runnig from the folder that contains repositories
:: as subfolders of the first level.

@echo off
set repo_main_dir=%~dp0

:: Remember login and password for git in Windows Credentials Manager
:: You must to comment this comand, if you don't want to save password
call git config --global credential.helper wincred

:: Cheching all subfolder of one level to .git folder detection
for /d %%B in (%repo_main_dir%*) do (

    if exist %%B\.git (
        cd /D %%B
        echo Updating %%B
        :: update repo with submodules
        call git fetch --progress --recurse-submodules=yes origin
    )

)

pause
