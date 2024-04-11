# Daniel Martinec 4/11/2024

function check-service($startLetter) {
    Get-Service -name $startLetter | Sort-Object status -descending | Format-Table DisplayName, Status
}

check-service("a*")

$crs = check-service($startLetter)

$servRun = "Cellular Time"

if(get-service $servRun | Where-Object {$_.Status -eq "Running"}) {
    Write-Host 'Running'
} else {
    Write-Host 'Not Running'
}
