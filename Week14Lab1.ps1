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

New-ADOrganizationalUnit -name $dept -path '.\DC=CIST,DC=ORG'