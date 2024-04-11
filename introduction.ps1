
<#
function main {
    # param($myvar)
    
    # Variable
    $count = 0
    
    # Array
    $numbers = @(1, 2, 3, 4, 5)
    
    # While loop
    while ($count -lt $numbers.count) {
        try {
            # If/else statement
            if ($numbers[$count] % 2 -eq 0) {
                Write-Output ($numbers[$count]) + "is even"
            }
            else{
                Write-Output ($numbers[$count]) + "is odd"
            }
            $count += 1
        }
        catch { 
            Write-Output("Index out of range")
            break
        }
    }
}

# Works like __name__ and __main__
if ($MyInvocation.InvocationName -eq '.') {main}#>

<# $a = 3
Write-Host $a
$a.GetType()

$b = 3.3
Write-Host $b
$b.GetType()

$c = "3.3"
Write-Host $c
$c.GetType()

$d= $a + $b
Write-Host $d
#>

<# Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

$cred = Get-Credential
Panther$1342

get-aduser -filter * -server DC -Credential $cred
#>

