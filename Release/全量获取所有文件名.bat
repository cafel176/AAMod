@echo off
cls

:: 开始获取管理员权限
fltmc>nul||mshta vbscript:CreateObject("Shell.Application").ShellExecute("%~dpnx0","%*",,"runas",1)(window.close)&&exit
:: 完成获取

@echo 处理中，请耐心等待，没有提示按任意键继续前不要关闭

@echo 获取Data
del /f /s /q /a "%~dp0DataFiles.txt"
for /f "tokens=1* delims=\" %%A in (
  'forfiles /p "%~dp0Data" /s /m *.* /c "cmd /c echo @relpath"'
) do for %%F in (^"%%B) do ( 
  	set "out=%%~F"
  	call set "out=%%out:\=/%%"
	call echo %%out%% >> "%~dp0DataFiles.txt" 
)
::"%~dp0DataDeletes.txt" 
@echo 完成

pause