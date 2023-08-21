Get-Process |
Select-Object Name, Id, WS, CPU |
Where-Object WS -ge 1MB |
Sort-Object CPU -Descending -Top 2 |
ConvertTo-Html |
Out-File /home/project/out.html



function Get-VerbGroup {
  $verbs = Get-Verb
  $verbs | Group-Object Group
}
Get-VerbGroup



function help-online {
	get-help select-object -online
	}
help-online


function Get-VerbGroup {
  param($Top)
  $verbs = Get-Verb
  $verbs |
  Group-Object Group |
  Sort-Object Count -Top $Top -Descending
}
Get-VerbGroup -Top 3

function show-usb {
	get-pnpdevice -presentonly | where-object {$_.InstanceId -match '^USB'}
}

show-usb

function shutdown {
	stop-computer -ComputerName localhost
}
shutdown

Function Lock-WorkStation { 
$signature = @"
[DllImport("user32.dll", SetLastError = true)] 
public static extern bool LockWorkStation();
"@
$LockWorkStation = Add-Type -memberDefinition $signature -name "Win32LockWorkStation" -namespace Win32Functions -passthru 
$LockWorkStation::LockWorkStation()
}

Lock-WorkStation

Function top-five-commands{
	Get-Command -CommandType Cmdlet | 
	Group-Object Verb | 
	Sort-Object Count -Descending -Top 5
}

get-help copy-item -online
get-help remove-item -online
get-help new-item -online

get-alias | out-host -Paging
clear-host
get-alias | where-object {$_.DisplayName -match "->"} | out-host -Paging

$verbs = Get-Verb

New-Item Script.ps1 -ItemType File

Get-Help about_Pipeline
Get-Help about_Variables
Get-Help about_Scripts
Get-Help about_Functions

Get-Command -Name *process*

Get-Help -Name Get-Process

Get-Process -Name *

Get-Process -Name pwsh

Write-Host -object "Hello World!" -ForegroundColor green


get-process | get-member
clear-host-
(get-process).VirtualMemorySize64

get-help get-content -online


#https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.3