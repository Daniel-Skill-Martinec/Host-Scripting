<#
enter-pssession -ComputerName DC -Credential $cred

cist\drm123
Panther$1342

Import-Module ActiveDirectory

cd "AD:"

cd 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

dir c:\files
#>

$dept = Import-Csv -Path "C:\files\departments.csv"

ForEach ($department in $dept) {
    # Take out names in .csv
    $departmentName = $department.Department

    # Make OU
    $ouPath = "OU=$departmentName,OU=Sales,OU=Departments,DC=cist,DC=org"

    # Make Group for Department
    New-ADOrganizationalUnit -name $departmentName -path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

    # Create Groups in OU and add Group to end
    $groupName = $departmentName + " Group"
    New-ADGroup -Name $groupName -GroupScope Global -Path $ouPath -Description "Group in $departmentName"
}

# Users I Used
New-ADUser -Name "Hannah Stank" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Hannah" -Surname "Stank" -EmailAddress "hannah.stank@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
New-ADUser -Name "Beth Train" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Beth" -Surname "Train" -EmailAddress "beth.train@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
New-ADUser -Name "Keith Mumford" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Keith" -Surname "Mumford" -EmailAddress "Keith.mumford@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
New-ADUser -Name "Alice Mumford" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Alice" -Surname "Mumford" -EmailAddress "Alice.mumford@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'
New-ADUser -Name "Emma Jones" -AccountPassword (ConvertTo-SecureString "P@ssWord" -AsPlainText -Force) -GivenName "Emma" -Surname "Jones" -EmailAddress "Emma.jones@example.com" -Path 'OU=Sales,OU=Departments,DC=CIST,DC=ORG'

# The array of my users
# Define an array of user names
$userNames = @("Hannah Stank", "Beth Train", "Keith Mumford", "Alice Mumford", "Emma Jones")

foreach ($userName in $userNames) {
    Enable-ADAccount -Identity $userName
}

# Create Engineering OU
New-ADOrganizationalUnit -Name "Engineering" -Path "OU=Sales,OU=Departments,DC=CIST,DC=ORG"

# Create Engineering group
New-ADGroup -Name "Engineering" -GroupScope Global -Path "OU=Engineering,OU=Sales,OU=Departments,DC=CIST,DC=ORG"

# Add to Engineering Group
$groupName = "Engineering"
foreach ($userName in $userNames) {
    Add-ADGroupMember -Identity $groupName -Members $userName
}

Get-ADGroupMember -Identity $groupName

# Move
$EnginPath = "OU=Engineering,OU=Sales,OU=Departments,DC=Cist,DC=Org" 
foreach ($userName in $userNames) {
    Get-ADUser -Identity $userName | Move-ADObject -TargetPath $EnginPath
}
Get-ADUser -Filter * -SearchBase $EnginPath

# Set Property
$Engin = "Engineering"
foreach ($userName in $userNames) {
    Set-ADUser -Identity $userName -Department $Engin
}

# Navigate and List
$EnginPath = "OU=Engineering,OU=Sales,OU=Departments,DC=Cist,DC=Org" 

# List in Container
$usersIn = Get-ADUser -Filter * -SearchBase $EnginPath -Property Department
Write-Host "Users in Engineering Container:"
$usersIn | Format-Table Name, SamAccountName, Department

# List Groups
$groupsIn = Get-ADGroup -Filter * -SearchBase $EnginPath
Write-Host "Groups in Engineering Container:"
$groupsIn | Format-Table Name, SamAccountName, GroupCategory, GroupScope
