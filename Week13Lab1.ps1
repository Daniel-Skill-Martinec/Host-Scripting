function installFeature {
    $givenfeature = "telnet-client"

    $checkInstall = Get-WindowsFeature | Where-Object {$_.Name -eq $givenfeature}

    if(-not $checkinstall.installed) {
        try {
            Install-WindowsFeature -name $givenfeature
        }
        catch {
            write-host 'Installation Failed'
        }
    }
    else {
        Write-Host 'Already Installed'
    }
}

installFeature