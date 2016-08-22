@echo off

rem Windows Batch Tools  Copyright (C) 2016 NJLYF2011
rem 本软件不附带额外保证。此外，它是自由软件，您可以在遵守 GNU GPL v3
rem 许可证的前提下对这款软件进行修改、再发布。

rem 检测 Cygwin 的初始值，若不存在，后面此值将变为0
set cygwin=1

rem 判断文件的完整性，如果您增减了文件且不想修改判断完整性的模块的话
rem 可以再此禁用（也就是注释掉相关命令）
rem call extra\check_lost.bat

rem 判断 Cygwin 环境是否存在
if not exist unix\menu.bat set cygwin=0
rem 至于为什么不在下面写，是为了以后的通用性考虑。
rem 其实这也是我的风格，我不太喜欢挨个来。23333


:main
cls
title 主菜单
echo.
echo =====================================================================
echo                     Windows Batch Tools 主菜单
echo.
echo 本程序是一些批处理脚本及小程序的合集（以批处理脚本为主）
echo.
echo 若没有特别声明，这些脚本的代码基于 GNU GPL v3 许可证下发布。
echo.
echo 本程序可能需要在管理员权限下运行。
if "%cygwin%"=="0" echo 检测到 Cygwin 组件不存在，故 Cygwin 功能已被禁用。
rem 上面就是我说的。
echo.
echo 0. 系统工具
echo 1. 文件工具
echo 2. 网络工具
echo 3. 磁盘工具
if "%cygwin%"=="1" echo 4. Cygwin 环境

echo =====================================================================
set cygwin=
set /p choice= 请输入您需要的选项并按回车：
rem 先cd，再执行，刚刚测试的时候吃了苦头（为了通用性而考虑），
if "%choice%"=="0" call cd system & call menu.bat
if "%choice%"=="1" call cd file & call menu.bat
if "%choice%"=="2" call cd network & call menu.bat
if "%choice%"=="3" call cd unix & call menu.bat

echo 错误：当前输入无效，请重新输入。
pause
goto main
