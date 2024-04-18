get-service | Where-Object CanStop

$servers = @('zonnon-dh.univ.pitt.edu','mythryl-dh.univ.pitt.edu','perl-dh.univ.pitt.edu','dbase-dh.univ.pitt.edu')

foreach ($server in $servers) {
    Write-Host $server
    try {
        Test-NetConnection -computername $server
        get-vm 

    }
    catch {
        Write-Host Server is Unreachable
    }
}

enter-PsSession -ComputerName DC -Credential $cred

Import-Module ActiveDirectory

cd 'AD:'
cd 'dc=cist,dc=org'
cd 'cn=users'

dir | format-list name, givenname, surname, status