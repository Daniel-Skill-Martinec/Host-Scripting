<#
enter-pssession -ComputerName DC -Credential $cred

cist\drm123
Panther$1342

Import-Module ActiveDirectory

cd "AD:"

cd 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
#>
new-psdrive csv -PSProvider Filesystem -Root \\dc\c$ -Credential $cred

$cred = Get-Credential


$users = Import-Csv -Path "C:\Users\drm123\Desktop\Host Scripting PSVS\SalesADUsers(in).csv"


foreach ($user in $users) {
    # Generate username
    $username = $user.fname + "." + $user.lname

    $password = 'P@ssWord'

    # Set user parameters
    $userParams = @{
        'Name' = $username
        'SamAccountName' = $username
        'GivenName' = $user.fname
        'Surname' = $user.lname
        'EmailAddress' = $user.email
        'Department' = $user.department
        'AccountPassword' = $password
        'Enabled' = $true
    }

    # Create the user account
    New-ADUser @userParams

    # Output username and password to log file
    $logEntry = "Username: $username, Password: $password"
    $logEntry | Out-File -FilePath "C:\Users\drm123\Desktop\Host Scripting PSVS\sales.txt" -Append

    Write-Host "User $username created with password $password"
}

