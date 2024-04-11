# Daniel Martinec 4/11/2024

function check-service {
    Get-Service -name "s*" | Sort-Object status -descending | Format-Table DisplayName, Status
}

$crs = 'check-service'


$servRun = "SysMain"

if(get-service -name $servRun) {
    Write-Host 'Not Running'
} else {
    Write-Host 'Running'
}