$computers=get-content -path C:\scripts\computers.txt
$results = ForEach ($Computer in $Computers)
{
    try {
    # remote computer might not be accessible! 
    $computerSystem = Get-CimInstance CIM_ComputerSystem -computername $computer
    $computerBIOS = Get-CimInstance CIM_BIOSElement -computername $computer
    $computerOS = Get-CimInstance CIM_OperatingSystem -computername $computer
    $computerCPU = Get-CimInstance CIM_Processor -computername $computer
    $computerHDD = Get-CimInstance Win32_LogicalDisk -computername $computer -Filter "DeviceID = 'C:'"}
    # once you've collected the data, prepare output string
    $output="System Information for: $($computerSystem.Name)`r`n"
    $output+="Manufacturer: $($computerSystem.Manufacturer)`r`n"
    $output+="Model: $($computerSystem.Model)`r`n"
    $output+="Serial Number: $($computerBIOS.SerialNumber)`r`n"
    $output+="CPU: $($computerCPU.Name)`r`n"
    $output+="HDD Capacity: $("{0:N2}" -f ($computerHDD.Size/1GB)) GB`r`n"
    $output+="HDD Space: $("{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size)) Free ($({0:N2}" -f ($computerHDD.FreeSpace/1GB)) GB)"
    $output+="RAM: $({0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB)) GB`r`n"
    $output+="Operating System: $($computerOS.caption), Service Pack: $($computerOS.ServicePackMajorVersion)`r`n"
    $output+="User logged In: $($computerSystem.UserName)`r`n"
    $output+="Last Reboot: $($computerOS.LastBootUpTime)`r`n"
    } catch {
    $output="$computer is not accessible!"
    }
    # once built, output the string into the variable
    $output
}
$results | Out-File c:\scripts\computer_details\ComputerDetails.txt -Encoding UTF8