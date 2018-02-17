# set font size to 14

REG ADD HKCU\Console /v FaceName /d "Lucida Console" /f
REG ADD HKCU\Console /v FontSize /t REG_DWORD /d 0x000e0000 /f
REG ADD HKCU\Console /v FontWeight /t REG_DWORD /d 0x00000190 /f
REG ADD HKCU\Console /v FontFamily /t REG_DWORD /d 0x36 /f

Push-Location
Set-Location HKCU:\Console
New-Item ".\%SystemRoot%_system32_WindowsPowerShell_v1.0_powershell.exe"
Set-Location ".\%SystemRoot%_system32_WindowsPowerShell_v1.0_powershell.exe"

New-ItemProperty . FaceName -type STRING -value "Lucida Console"
New-ItemProperty . FontFamily -type DWORD -value 0x00000036
New-ItemProperty . FontSize -type DWORD -value 0x000e0000
New-ItemProperty . FontWeight -type DWORD -value 0x00000190
New-ItemProperty . HistoryNoDup -type DWORD -value 0x00000000
New-ItemProperty . QuickEdit -type DWORD -value 0x00000001
Pop-Location

Push-Location
Set-Location HKCU:\Console
New-Item '.\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe'
Set-Location '.\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe'

New-ItemProperty . FaceName -type STRING -value "Lucida Console"
New-ItemProperty . FontFamily -type DWORD -value 0x00000036
New-ItemProperty . FontSize -type DWORD -value 0x000e0000
New-ItemProperty . FontWeight -type DWORD -value 0x00000190
New-ItemProperty . HistoryNoDup -type DWORD -value 0x00000000
New-ItemProperty . QuickEdit -type DWORD -value 0x00000001
Pop-Location
