Function Reset-Komorebi {
	[CmdletBinding()]
	param(
		[switch]$CleanState
	)

	Write-Host "Restart: Komorebi $(if($CleanState){ '(CleanState)' }))" -f Yellow
	Stop-Process -Name komorebi -EA 0

	if ($CleanState) {
		Start-Process Komorebic -ArgumentList "start --clean-state" -WindowStyle Hidden
	}
	else {
		Start-Process Komorebic -ArgumentList "start --whkd" -WindowStyle Hidden
	}
}

New-Alias l ls
Write-Host 'Init: oh-my-posh' -f Yellow
oh-my-posh init pwsh --config C:\Users\upgrad3\AppData\Local\Programs\oh-my-posh\themes\nordtron-yaru.omp.json | Invoke-Expression

Write-Host 'Import: Terminal-Icons' -f Yello
Import-Module Terminal-Icons

if(!(Get-Process komorebi -EA 0)){
	Write-Host 'Start: Komorebi' -f Yellow
	Start-Process Komorebic -ArgumentList "start" -WindowStyle Hidden
}

if(!(Get-Process whkd -EA 0)){
	Write-Host 'Start: WHKD' -f Yellow
	Start-Process whkd -WindowStyle Hidden
}


Clear-Host
Write-Host '                                  ______' -f gray
Write-Host "    _____________________________/" -f gray -n; Write-Host "::'" -f Cyan -n; Write-Host "   \" -f gray
Write-Host "   /" -f gray -n; Write-Host ":'" -f Cyan -n; Write-Host '   \' -f gray -n; Write-Host "::'" -f Cyan -n; Write-Host '    \' -f gray -n;
Write-Host "::'" -f Cyan -n; Write-Host '    \' -f gray -n; Write-Host "::'" -f Cyan -n; Write-Host ' _  \' -f gray -n; Write-Host ":'" -f Cyan -n;
Write-Host " |   \" -f gray
Write-Host "  /" -f gray -n; Write-Host ":'" -f Cyan -n; Write-Host " |   \" -f gray -n; Write-Host "'" -f Cyan -n;
Write-Host "  -   \" -f gray -n; Write-Host "'" -f Cyan -n; Write-Host "    | \" -f gray -n; Write-Host "'" -f Cyan -n; Write-Host "    __\_     / n9! - [ " -f gray -n
Write-Host 'nodenine' -f Cyan -n; Write-Host  ' ]' -f gray
Write-Host ' +\___|___/_______/_______/_______/_____/--------------------------------------------------+' -f gray