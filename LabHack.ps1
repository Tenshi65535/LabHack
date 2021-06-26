Set-Service -Name "wuauserv" -Status running -StartupType automatic
#Set-Service -Name "WSearch" -Status running -StartupType automatic
$LangList = Get-WinUserLanguageList
$LangList.Add("zh-hans-CN")
Set-WinUserLanguageList $LangList -Confirm:$false
$DiskLettList = (Get-Partition).DriveLetter -match '^[E-I]{1}$|^[K-V]{1}$'
foreach ($DiskLett in $DiskLettList)
{
    New-Item -ItemType directory -Path D:\$DiskLett
    Add-PartitionAccessPath -DriveLetter $DiskLett -AccessPath D:\$DiskLett
}
#C:\"Program Files"\"Classic Shell"\ClassicStartMenu.exe -exit
#C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe