# Daniel Martinec 2/26/2024

get-service | Where-Object {$_.DelayedAutoStart -eq $true}

Get-LocalGroup | Sort-Object -Descending

Get-LocalUser | Format-Table name, passwordexpires, enabled

Get-Process | Where-Object { $_.WorkingSet -gt 100MB } | Sort-Object cpu -Descending | format-table name, cpu