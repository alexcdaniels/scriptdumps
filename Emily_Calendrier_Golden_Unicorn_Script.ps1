$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential 'alex.daniels@waterlogic.co.uk' -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking -AllowClobber


Get-Content c:\files\Names.txt| foreach {Add-MailboxFolderPermission -Identity $_ -User dorcas.yofoua@waterlogic.fr -AccessRights Editor}

