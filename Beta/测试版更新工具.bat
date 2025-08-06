@echo off
cls

:: 开始获取管理员权限
fltmc>nul||mshta vbscript:CreateObject("Shell.Application").ShellExecute("%~dpnx0","%*",,"runas",1)(window.close)&&exit
:: 完成获取

@echo - 轴心与同盟 Axis Allies 联机测试版 更新工具 by 海盗(Spica)
@echo -------------------------------------------------------------------

:: 游戏exe检查
if not exist "%~dp0AA.exe" (
   echo 未找到 AA.exe 请检查本工具是否放到了游戏目录下
   goto finish
) 
:: 完成检查

setlocal EnableDelayedExpansion

@echo 开始更新
@echo ----------------------------------------------------------

@echo 删除Data文件夹
del /f /s /q /a "%~dp0Data"
@echo 完成

@echo ----------------------------------------------------------

set path=https://ghfile.geekertao.top/https://raw.githubusercontent.com/cafel176/AAMod/refs/heads/main/Beta/
set source="%~dp0DataFiles.txt"

@echo 更新Data文件
curl "%path%DataFiles.txt" > "%~dp0DataFiles.txt"
md "%~dp0Data"
for /f %%i in ('type %source%') do (
	echo %path%Data/%%i 

	md "%~dp0Data/%%i2"
	rd "%~dp0Data/%%i2"

	curl "%path%Data/%%i" > "%~dp0Data/%%i"
)
del /f /s /q /a "%~dp0DataFiles.txt"

@echo 完成

@echo ----------------------------------------------------------
@echo 更新完成
:finish
pause