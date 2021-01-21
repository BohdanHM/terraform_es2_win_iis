$aws_web_ip1 = "18.135.13.220"
$aws_web_ip2 = "18.132.45.213"

$instahce_password = "M2ygGj67HFSD22pa88"
$admin_name = "Admin2"

#winrm set winrm/config/client '@{TrustedHosts="'($aws_web_ip1)'"}'
winrm set winrm/config/client '@{TrustedHosts="'($aws_web_ip1)','($aws_web_ip2)'"}'
net stop winrm
sc.exe config winrm start=auto
net start winrm



$password1 = ConvertTo-SecureString $instahce_password -AsPlainText -Force
$cred1= New-Object System.Management.Automation.PSCredential -argumentlist $admin_name, $password1
$session = New-PSSession -ComputerName $aws_web_ip1,$aws_web_ip2 -Credential $cred1

Copy-Item –Path  "C:\Copy_web\NewSite\*" –Destination "C:\Copy_site\NewSite\" -Recurse -Force –ToSession $session[0]
Copy-Item –Path  "C:\Copy_web\NewSite\*" –Destination "C:\Copy_site\NewSite\" -Recurse -Force –ToSession $session[1]

#Enter-PSSession -ComputerName $aws_web_ip1 -Credential $cred1
Invoke-Command -ScriptBlock {
Import-Module WebAdministration


Copy-Item -Path "$env:systemdrive\inetpub\wwwroot\*" -Destination "$env:systemdrive\Copy_site\OldSite\" -Recurse
Remove-Item  -Path "$env:systemdrive\inetpub\wwwroot\*"  -Recurse
#New-Item -Path "$env:systemdrive\inetpub\" -Name "wwwroot" -ItemType "directory"
Copy-Item -Path "$env:systemdrive\Copy_site\NewSite\*" -Destination "$env:systemdrive\inetpub\wwwroot\" -Recurse
Remove-Website -Name "Default Web Site"
Remove-WebAppPool "DefaultAppPool"

New-WebAppPool 'DefaultAppPool'  -Force
New-Website -Name 'Default Web Site' -Port 80 -PhysicalPath "$env:systemdrive\inetpub\wwwroot\"  -Force

Remove-Item -Path  "$env:systemdrive\Copy_site\NewSite\*" -Recurse
} -ComputerName $aws_web_ip1, $aws_web_ip2 -Credential $cred1


#    Local Folder C:\Copy_web\NewSite
#    Remote WebSerwers Folders :
#     C:\Copy_site\NewSite
#     C:\Copy_site\OldSite
#Exit-PSSession
#Remove-PSSession -ComputerName $aws_web_ip1
#Exit-PSSession
#Remove-PSSession -ComputerName $aws_web_ip1
