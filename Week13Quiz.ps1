# Daniel Martinec 4/11/2024
# Part 1
function check-service {
    param (
        [string]$startLetter
    )

    Get-Service -Name "$startLetter*" | Sort-Object Status -Descending | Select-Object DisplayName, Status, @{Name="ComputerName";Expression={$env:COMPUTERNAME}} | Format-Table
}
# -ComputerName did not exist so it does now
check-service -startLetter "a"

New-Alias -Name crs -Value check-service

crs -startLetter "s"

#Part 2
# Cellular Time is Not Running
# SysMain is Running
$servRun = "SysMain"

if(get-service $servRun | Where-Object {$_.Status -eq "Running"}) {
    Write-Host 'Running'
} else {
    Write-Host 'Not Running'
}

#ForEach
$ServMatch = Get-Service $servRun
ForEach ($service in $ServMatch) {
    Write-Host "Service $($service.DisplayName) has status $($service.Status)"
}

Get-Service $servRun | Out-File -FilePath "ServiceStatus.txt"