function installFeature {
    param (
        [string]$givenfeature
    )

    $checkInstall = Get-WindowsFeature | Where-Object {$_.Name -eq $givenfeature}

    if(-not $checkinstall.installed) {
        try {
            $logFilePath = "$env:USERPROFILE\feature.log"
            Add-WindowsFeature -Name $givenfeature -LogPath $logFilePath
            Write-Host "Installation of $givenfeature succeeded."
        }
        catch {
            write-host 'Installation Failed'
        }
    }
    else {
        Write-Host 'Already Installed'
    }
}

installFeature -givenfeature "telnet-client"