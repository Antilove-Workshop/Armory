@echo off
color f0
echo 修改远程桌面3389端口(支持Windows 2003 2008 2008R2 2012 2012R2 7 8 10 )
echo 自动添加防火墙规则
echo %date%   %time%
echo    ARK
set /p c= 请输入新的端口:
if "%c%"=="" goto end
goto edit
:edit
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"



reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp" /v PortNumber /t reg_dword /d %c% /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t reg_dword /d %c% /f




echo 修改成功
echo 重启后生效，按任意键重启
pause
shutdown /r /t 0
exit
:end
echo 修改失败
pause