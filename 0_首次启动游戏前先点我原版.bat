::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQK15uPSut0K17o88FKZJgR9Gj4AS6Vddfo2a8/61riHJfNTYqIu8HzlX5+3HxbCicyd+/d8Dg==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEcpfnr+CjBDeSNWi7T9U=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBhVSgGOAE+/Fb4I5/jHv9UOZLubmCO6iEBeMHwI+DiVAqphnHuoM5LdehKK5OoWewquDg==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
@title 官方英文完整版 Axis Allies 自动配置启动器 by 海盗(Spica)
cls

:: 开始获取管理员权限
fltmc>nul||mshta vbscript:CreateObject("Shell.Application").ShellExecute("%~dpnx0","%*",,"runas",1)(window.close)&&exit
:: 完成获取

@echo - 官方英文完整版 Axis Allies 自动配置启动器 by 海盗(Spica)
@echo - 请注意，您的游戏文件完整路径下不能包含特殊字符，否则本程序可能无法正常运行
@echo - 正确范例 "D:\MyFile\My Game\Axis Allies 官方英文完整版"
@echo - 错误范例 "D:\My-File\My_Game\Axis & Allies 官方英文完整版"
@echo -------------------------------------------------------------------

:: 系统版本检查
ver | find "10.0.1"> nul && goto win10
ver | find "10.0.2"> nul && goto win11
goto other

:win10

goto end

:win11

goto end

:other

goto end

:: 完成检查

:end

@echo - 删除旧的设置
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0AA.exe" /f /reg:64
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0AA.exe" /f /reg:64
@echo - 完成
@echo -------------------------------------------------------------------
@echo - 设置数据保护
@echo - 请注意，您的游戏文件完整路径下不能包含特殊字符，否则数据保护可能无法正常设置！！！
@echo - 正确范例 "D:\MyFile\My Game\Axis Allies 官方英文完整版"
@echo - 错误范例 "D:\My-File\My_Game\Axis & Allies 官方英文完整版"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0AA.exe" /t REG_SZ /d "DisableNXShowUI" /f /reg:64
@echo - 设置兼容性
@echo - 设置以管理员身份启动
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0AA.exe" /t REG_SZ /d "~ RUNASADMIN WINXPSP3 HIGHDPIAWARE" /f /reg:64
@echo - 完成
@echo -------------------------------------------------------------------
@echo 全部完成，请双击AA.exe启动游戏
:finish
pause