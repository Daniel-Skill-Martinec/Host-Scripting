enter-pssession -ComputerName DC -Credential $cred

cist\drm123
Panther$1342

Import-Module ActiveDirectory

cd "AD:"

cd 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

# 1)
New-ADUser -Name "Oliver Stitch" -SamAccountName "Oliver.Stitch" -GivenName "Oliver" -Surname "Stitch" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -Enabled $true
# 2)
Set-ADAccountPassword -Identity "Oliver.Stitch" -NewPassword (ConvertTo-SecureString "NewP@ssWord" -AsPlainText -Force)
Get-ADUser -Identity "Oliver.Stitch" -Properties PasswordLastSet
# 3)
# Simulation
Set-ADDefaultDomainPasswordPolicy -LockoutThreshold 3 -Identity cist.org

Get-ADUser -Filter "Name -like 'Oliver.Stitch'" -Properties LockedOut

Unlock-ADAccount -Identity "Oliver.Stitch"
# 4)
Get-ADUser -Filter {Surname -like "H*"} -SearchBase 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

