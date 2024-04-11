# Daniel Martinec 3/22/2024

$port = 80

$servers = @("www.google.com", "www.pitt.edu", "www.cnn.com")

$servers += "Unixs.cis.pitt.edu"

Write-Host $servers[2]

$servers.count

$servers | ForEach-Object {
    Test-NetConnection -ComputerName $_ -Port $port | ForEach-Object {
        if($_.TcpTestSucceeded){
            Write-Host "$($_.ComputerName) is on port $port"
        } else {
            Write-Host "$($_.ComputerName) is not on port $port"
            break
        }
    }
}