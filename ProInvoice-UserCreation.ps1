# Create Accounts Required for Proinvoice
# Auth: 	Eric Hoy
# Date: 	10/08/2016
# Revi:		0.9
# Note:		Need to add variables to specify Customer Code

Import-Module ServerManager
Import-Module ActiveDirectory

$CustCode="AZI"
$ADDomainUNC=$CustCode + '.local'
$ADDomainPath='DC=' + $CustCode + ',DC=LOCAL'
$ADResourcePath='OU=' + $CustCode + ',' + $ADDomainPath

#OU
New-ADOrganizationalUnit -Name $CustCode -Path $ADDomainPath
New-ADOrganizationalUnit -Name Accounts-Admin -Path $ADResourcePath
New-ADOrganizationalUnit -Name Accounts-Services -Path $ADResourcePath
New-ADOrganizationalUnit -Name Accounts-Users -Path $ADResourcePath
New-ADOrganizationalUnit -Name Groups -Path $ADResourcePath
New-ADOrganizationalUnit -Name Servers -Path $ADResourcePath

#Groups
New-ADGroup -Name "RuttleAdminDomain_Admin" -DisplayName "RuttleAdminDomain_Admin" -SamAccountName RuttleAdminDomain_Admin -Description "RuttleAdminDomain_Admin" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'
New-ADGroup -Name "RuttleAdminDomain_Access" -DisplayName "RuttleAdminDomain_Access" -SamAccountName RuttleAdminDomain_Access -Description "RuttleAdminDomain_Access" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'
New-ADGroup -Name "RuttleAdminDomain_SuperUsers" -DisplayName "RuttleAdminDomain_SuperUsers" -SamAccountName RuttleAdminDomain_SuperUsers -Description "RuttleAdminDomain_SuperUsers" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'
New-ADGroup -Name "RuttleAdminDomain_Setup" -DisplayName "RuttleAdminDomain_Setup" -SamAccountName RuttleAdminDomain_Setup -Description "RuttleAdminDomain_Setup" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'
New-ADGroup -Name "KoshinDomain_Admin" -DisplayName "KoshinDomain_Admin" -SamAccountName KoshinDomain_Admin -Description "KoshinDomain_Admin" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'
New-ADGroup -Name "KoshinDomain_Access" -DisplayName "KoshinDomain_Access" -SamAccountName KoshinDomain_Access -Description "KoshinDomain_Access" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'
New-ADGroup -Name "KoshinDomain_Schedules" -DisplayName "KoshinDomain_Schedules" -SamAccountName KoshinDomain_Schedules -Description "KoshinDomain_Schedules" -GroupCategory Security -GroupScope Global -Path 'OU=Groups,OU=AZI,DC=AZI,DC=LOCAL'


#Users - Sharepoint Services
New-ADUser -SamAccountName svc-spfarm -Name "svc-spfarm" -DisplayName "svc-spfarm" -GivenName "Service" -Surname "Sharepoint" -UserPrincipalName "svc-spfarm@azi.local" -Description "Service Account - Sharepoint" -AccountPassword (ConvertTo-SecureString -AsPlainText "RTOjp-2540_V2KKq-REs1" -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true -Path 'OU=Accounts-Services,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Sharepoint"
New-ADUser -SamAccountName svc-spsetup -Name "svc-spsetup" -DisplayName "svc-spsetup" -GivenName "Service" -Surname "Sharepoint Setup" -UserPrincipalName "svc-spsetup@azi.local" -Description "Service Account - Sharepoint Setup" -AccountPassword (ConvertTo-SecureString -AsPlainText "RTOjp-2540_V2KKq-REs1" -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true -Path 'OU=Accounts-Services,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Sharepoint"

#Users - Sharepoint Test Accounts
New-ADUser -SamAccountName sp.admin -Name "Test Sharepoint Admin" -DisplayName "sp.admin" -GivenName "Test" -Surname "Sharepoint Admin" -UserPrincipalName "sp.admin@azi.local" -EmailAddress sp.admin@progressive-tsl.com -Description "PTSL Support" -AccountPassword (ConvertTo-SecureString -AsPlainText "Western2016!" -Force) -Enabled $true -PasswordNeverExpires $false -CannotChangePassword $false -Path 'OU=Accounts-Users,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Sharepoint"
New-ADUser -SamAccountName sp.readonly -Name "Test Sharepoint Readonly" -DisplayName "sp.readonly" -GivenName "Test" -Surname "Sharepoint Readonly" -UserPrincipalName "sp.readonly@azi.local"  -EmailAddress sp.readonly@progressive-tsl.com -Description "PTSL Support" -AccountPassword (ConvertTo-SecureString -AsPlainText "Western2016!" -Force) -Enabled $true -PasswordNeverExpires $false -CannotChangePassword $false -Path 'OU=Accounts-Users,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Sharepoint"
New-ADUser -SamAccountName sp.testuser -Name "Test Sharepoint User" -DisplayName "sp.testuser" -GivenName "Test" -Surname "Sharepoint User" -UserPrincipalName "sp.testuser@azi.local"  -EmailAddress sp.testuser@progressive-tsl.com -Description "PTSL Support" -AccountPassword (ConvertTo-SecureString -AsPlainText "Western2016!" -Force) -Enabled $true -PasswordNeverExpires $false -CannotChangePassword $false -Path 'OU=Accounts-Users,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Sharepoint"

#Users - ProInvoice
New-ADUser -SamAccountName svc-sppurchasing -Name "svc-sppurchasing" -DisplayName "svc-sppurchasing" -GivenName "Service" -Surname "ProInvoice" -UserPrincipalName "svc-sppurchasing@azi.local" -Description "Service Account - ProInvoice" -AccountPassword (ConvertTo-SecureString -AsPlainText "RTOjp-2540_V2KKq-REs1" -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true -Path 'OU=Accounts-Services,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Evolution"
New-ADUser -SamAccountName svc-koshin -Name "svc-koshin" -DisplayName "svc-koshin" -GivenName "Service" -Surname "Koshin" -UserPrincipalName "svc-koshin@azi.local" -Description "Service Account - Koshin" -AccountPassword (ConvertTo-SecureString -AsPlainText "RTOjp-2540_V2KKq-REs1" -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true -Path 'OU=Accounts-Services,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Evolution"
New-ADUser -SamAccountName svc-ruttle -Name "svc-ruttle" -DisplayName "svc-ruttle" -GivenName "Service" -Surname "Ruttle" -UserPrincipalName "svc-ruttle@azi.local" -Description "Service Account - Ruttle" -AccountPassword (ConvertTo-SecureString -AsPlainText "RTOjp-2540_V2KKq-REs1" -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true -Path 'OU=Accounts-Services,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Evolution"

#Users - PTSL Test Accounts
New-ADUser -SamAccountName test.one -Name "Test One" -DisplayName "test.one" -GivenName "Test" -Surname "One" -UserPrincipalName "test.one@azi.local" -EmailAddress test.one@progressive-tsl.com -Description "PTSL Support" -AccountPassword (ConvertTo-SecureString -AsPlainText "Western2016!" -Force) -Enabled $true -PasswordNeverExpires $false -CannotChangePassword $false -Path 'OU=Accounts-Users,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Progressive TSL"
New-ADUser -SamAccountName test.two -Name "Test Two" -DisplayName "test.two" -GivenName "Test" -Surname "Two" -UserPrincipalName "test.two@azi.local"  -EmailAddress test.two@progressive-tsl.com -Description "PTSL Support" -AccountPassword (ConvertTo-SecureString -AsPlainText "Western2016!" -Force) -Enabled $true -PasswordNeverExpires $false -CannotChangePassword $false -Path 'OU=Accounts-Users,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Progressive TSL"

#Users - Evolution Support
New-ADUser -SamAccountName james.moore -Name "James Moore" -DisplayName "james.moore" -GivenName "James" -Surname "Moore" -UserPrincipalName "james.moore@azi.local" -EmailAddress test.one@progressive-tsl.com -Description "PTSL Support" -AccountPassword (ConvertTo-SecureString -AsPlainText "Western2016!" -Force) -Enabled $true -PasswordNeverExpires $false -CannotChangePassword $false -Path 'OU=Accounts-Users,OU=AZI,DC=AZI,DC=LOCAL' -Organization "Evolution"
