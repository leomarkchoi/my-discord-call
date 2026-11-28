@echo off
cd /d "%~dp0"
set MSG=%~1
if "%MSG%"=="" set MSG=Update MDC Hub UI

echo [1/4] Syncing with GitHub...
git pull origin main --rebase --autostash

echo [2/4] Copying index.html to root...
copy /Y my-discord-call\src\index.html index.html

echo [3/4] Committing changes...
git add index.html my-discord-call/src/index.html
git commit -m "%MSG%"

echo [4/4] Pushing to GitHub Pages...
git push origin main

echo Done!
