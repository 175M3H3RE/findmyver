@echo off

              (My lord and Saviour J35u4SS!) 2>NUL
set /a sup=0
set /a version=9009

set foundversion=
set foundversion1=

for /f "tokens=1,2,3,4 delims=:[]() " %%i in ('ver') do (echo %%i|find /i "version" >NUL&&set /a version=1)&(echo %%j|find /i "version" >NUL&&set /a version=2)&(echo %%k|find /i "version" >NUL&&set /a version=3)&(echo %%l|find /i "version" >NUL&&set /a version=4)
if %version%==9009 goto justchecking
set /a version=version+1
for /f "tokens=%version% delims=:[]() " %%i in ('ver') do echo %%i|findstr /r "^[0-9.]*$" >NUL&&(set foundversion=%%i&goto justchecking)
goto :eof
:justchecking
set /a pass+=1
set /a sup+=1
set /a sup1=sup+1
set /a sup2=sup+2
set /a sup3=sup+3
for /f "tokens=%sup%,%Sup1%,%Sup2%,%sup3% delims=:[]() " %%i in ('ver') do (echo %%i|findstr /r "^[0-9.]*$" >NUL&&set foundversion1=%%i)&(echo %%j|findstr /r "^[0-9.]*$" >NUL&&set foundversion1=%%j)&(echo %%k|findstr /r "^[0-9.]*$" >NUL&&set foundversion1=%%k)&(echo %%l|findstr /r "^[0-9.]*$" >NUL&&set foundversion1=%%l)
set /a pass+=1
if "%foundversion1%"=="%foundversion%" call :setexit0&goto printversion
if %pass% LEQ 1 goto justchecking
if "%foundversion1%"=="%foundversion%" call :setexit0&goto printversion
if "%foundversion1%" NEQ "%foundversion%" call :setexit1&goto printversion
:setexit0
Exit /B 0
:setexit1
Exit /B 1
:printversion
if defined foundversion echo %foundversion%
if not defined foundversion if defined foundversion1 echo %foundversion1%
