Copy-Item "\\192.168.0.205\Deployement\Install\" -Container -recurse "c:\temp\install"
Start-Process -FilePath 'c:\temp\install\FortiClientSetup_6.0.8_x64.exe' -ArgumentList '/quiet', '/norestart', '/S' -Wait
Start-Process -FilePath 'c:\temp\install\IP_Softphone_NCS_v4.1.0.2.exe' -ArgumentList '/quiet', '/norestart', '/S' -Wait
regedit /s "c:\temp\install\TeamViewer_Settings.reg"
Start-Process -FilePath 'c:\temp\install\TeamViewer_Host_Setup-idc2daw4nn.exe' -ArgumentList '/S' -Wait
Start-Process -FilePath 'c:\temp\install\tightvnc-2.7.10-setup-32bit.msi'
Copy-item "C:\temp\install\MYWLUK - INTERNAL.url" -Container -Recurse "C:\users\public\Desktop"
Copy-item "C:\temp\install\Waterlogic Service Now Helpdesk.url" -Container -Recurse "C:\users\public\Desktop"