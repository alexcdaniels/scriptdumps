function Get-Bios {
         param($computer)
if(-not($computer))
{
         Write-Warning "Please supply computername"
}

if(Test-Connection -ComputerName $computer -BufferSize 16 -Count 1 -ea 0 -quiet)
{

Try
{
         $ErrorActionPreference ="stop"
Get-WmiObject -Class win32_bios -Computer $computer|
Get-WmiObject -Class:Win32_ComputerSystem).Model
select @{n="ComputerName";e={$computer.toupper()}},SerialNumber,Manufacturer,Model
}

Catch
{
         Write-Host "$computer `b" -NoNewline -BackgroundColor red
         Write-Warning $error[0]
}
}

else
{
        Write-Host "$($computer) is offline" -ForegroundColor Red
}
}



if ( ! (Get-module ActiveDirectory )) {
Import-Module ActiveDirectory
Cls
}

get-ADComputer -filter * |select -exp name |foreach{Get-Bios -computer $_}