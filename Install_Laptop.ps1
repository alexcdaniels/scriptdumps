Set-ExecutionPolicy Bypass -Scope process -Force;

#install forticlient, ipsoftphone 
$UNCToSoftware = '\\192.168.0.205\Deployement'
$listOfSoftwareToInstall = 'FortiClientSetup_6.0.8_x64.exe','IP_Softphone_NCS_v4.1.0.2.exe',''
$listOfSoftwareToInstall | %{Start-process -FilePath "$UNCToSoftware\$_" -ArgumentList '/quiet', '/norestart', '/S' -Wait};
# install office 365 pro
$UNCToSoftware = '\\192.168.0.205\Deployement\O365\'
$listOfSoftwareToInstall = 'setup.exe ',
$listOfSoftwareToInstall | %{Start-process -FilePath "$UNCToSoftware\$_" -ArgumentList '/quiet', '/norestart', '/S','/Configure configuration64.xml', -Wait}








