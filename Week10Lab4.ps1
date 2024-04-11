$port = 80

$servers = @("www.google.com", "Unixs.cis.pitt.edu", "www.pitt.edu", "www.pittbradford.org", "zonnon.univ.pitt.edu")

$servers | ForEach-Object {
    Test-NetConnection -ComputerName $_ -Port $port 
 } | Sort-Object PingSucceeded | ConvertTo-Html | Out-File "nettest.htm"







