<#
.SYNOPSIS
    A script to quickly add a new VPN connections

.DESCRIPTION
    Removes the 7 - 8 GUI clicks required to make a new connection in Windows.
    With this script you can quickly reuse to make new VPN connections with a one stop shop


.INPUTS
    None

.OUTPUTS
    New Windows VPN connection

.EXAMPLE
    Enter VPN Name: CompanyName
    Enter VPN FQDN: CompanyName.VPN.com
    Enter Pre-Shared Key: The Password needed to auth for the VPN

.NOTES
    Author: Avi Avila
    Date: 1/18/23

.LINK
    www.github.com/Avila5301
#>

function textTitle {

write-host "             _     _     __      _______  _   _ "
write-host "    /\      | |   | |    \ \    / /  __ \| \ | |"
write-host "   /  \   __| | __| |_____\ \  / /| |__) |  \| |"
write-host "  / /\ \ / _`  |/ _`  |______\ \/ / |  ___/| . `  |"
write-host " / ____ \ (_| | (_| |       \  /  | |    | |\  |"
write-host "/_/    \_\__,_|\__,_|        \/   |_|    |_| \_| `n"
 
}
                                           
function AddNewVPN {
    
    $vpnName = Read-Host "Enter New VPN Name: " 
    $srvAddress = Read-Host "Enter VPN FQDN or IP Address: " 
    $psk = Read-Host "Enter the Pre-Shared Key Password: " -AsSecureString

    Add-VpnConnection -Name $vpnName -ServerAddress $srvAddress -TunnelType L2tp -EncryptionLevel Optional -AuthenticationMethod Pap -L2tpPsk $psk
    Write-Host -ForegroundColor Yellow "`nFinished Adding and configureing your new VPN Connection "$vpnName" `n"
    
}

    try {
        textTitle
        AddNewVPN
    }
    Catch [System.OutOfMemoryException] 
    # To handle a specific error
    {
        Write-Host -BackgroundColor Red -ForegroundColor Yellow "An Memory Error Has Occured"
        Write-Host -ForegroundColor Red -BackgroundColor Yellow "$_"
    }
Catch
    # To handle any other error
    {
        Write-Host -BackgroundColor Red -ForegroundColor Yellow "An unhandled Execption has Occurred"
        Write-Host -ForegroundColor Red -BackgroundColor Yellow "$_"
    }