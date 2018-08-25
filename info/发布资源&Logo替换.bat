@echo off

set /p NEWVER=请输入新的资源版本:
call python replace.py %NEWVER%

rem 资源发布及logo替换
copy logo\logon_logo.png ..\client\client\res\Logon
copy logo\logo_name_00.png ..\client\base\res
copy logo\logo_text_00.png ..\client\base\res

if not exist "..\client_publish" (
	mkdir ..\client_publish
)

call zip_file.bat 1

set h=%time:~0,2%
set h=%h: =0%
set folder=%date:~0,4%-%date:~5,2%-%date:~8,2%-%h%%time:~3,2%

if not exist "..\client_publish\%folder%\base" (
	mkdir ..\client_publish\%folder%\base
)

if not exist "..\client_publish\%folder%\command" (
	mkdir ..\client_publish\%folder%\command
)


if not exist "..\client_publish\%folder%\client" (
	mkdir ..\client_publish\%folder%\client
)

if not exist "..\client_publish\%folder%\game" (
	mkdir ..\client_publish\%folder%\game
)

xcopy /y /e ..\client\ciphercode\base ..\client_publish\%folder%\base
xcopy /y /e ..\client\ciphercode\command ..\client_publish\%folder%\command
xcopy /y /e ..\client\ciphercode\client ..\client_publish\%folder%\client
xcopy /y /e ..\client\ciphercode\game ..\client_publish\%folder%\game

pause