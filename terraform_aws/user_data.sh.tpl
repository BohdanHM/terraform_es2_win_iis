
<powershell>
Start-Transcript;
net user ${user} ${password} /add /y
net localgroup administrators ${user} /add
#net user "Admin2" "M2ygGj67HFSD22pa88" /add /y
#net localgroup administrators "Admin2" /add

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow
winrm set winrm/config/client '@{TrustedHosts="'($my_ip_add)'"}'
net stop winrm
sc.exe config winrm start=auto
net start winrm


# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

New-Item -Path "C:\" -Name "Copy_site" -ItemType "directory"
New-Item -Path "C:\Copy_site\" -Name "NewSite" -ItemType "directory"
New-Item -Path "C:\Copy_site\" -Name "OldSite" -ItemType "directory"

</powershell>
