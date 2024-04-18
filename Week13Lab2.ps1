enter-pssession -ComputerName DC -Credential $cred

cist\drm123
Panther$1342

Import-Module ActiveDirectory

cd "AD:"

cd 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

# 1)
New-ADUser -Name "Hannah Stank" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Hannah" -Surname "Stank" -EmailAddress "hannah.stank@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
New-ADUser -Name "Beth Train" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Beth" -Surname "Train" -EmailAddress "beth.train@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
New-ADUser -Name "Keith Mumford" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Keith" -Surname "Mumford" -EmailAddress "Keith.mumford@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
# 2)
Get-ADUser -Filter * -SearchBase 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
# 3)
$users = @("Hannah Stank", "Beth Train", "Keith Mumford")
$users | ForEach-Object { Set-ADUser -Identity $_ -AccountExpirationDate "1/1/2024" }
$users | ForEach-Object { Get-ADUser -Identity $_ }
# 4)
Get-ADUser -Filter * -SearchBase 'OU=Sales,OU=Departments,DC=CIST,DC=ORG' | Enable-ADAccount
# 5)
Set-ADAccountPassword -Identity "Hannah Stank" -NewPassword (ConvertTo-SecureString "NewP@ssWord" -AsPlainText -Force)
Get-ADUser "Hannah Stank" -Properties PasswordLastSet
# 6)
Remove-ADUser -Identity "Keith Mumford"
Get-ADUser -Filter * -SearchBase 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

# Install-WindowsFeature RSAT-AD-PowerShell