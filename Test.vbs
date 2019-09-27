Option Explicit

Set MySite = CreateObject("CuteFTPPro.TEConnection")
'Initialize remote server host name, protocol, port, etc.
MySite.Protocol = "FTPS_AUTH_TLS"
MySite.Host = "ftgateway04.swisspostsolutionsuk.com"
MySite.Port = 4021
' WARNING!!! SENSITIVE DATA: user name and password.
MySite.Login = "28801"
MySite.Password = "9co3u83ItQcU3FU0FKZM"
MySite.SocksInfo = ""
MySite.ProxyInfo = ""
MySite.Retries = 30
MySite.Delay = 30
MySite.MaxConnections = 4
MySite.TransferType = "AUTO"
MySite.DataChannel = "DEFAULT"
MySite.AutoRename = "OFF"
MySite.Connect
MsgBox.MySite.Log
' Connect and login to the FTP server.
success = ftp.Connect()
If (success <> 1) Then
    outFile.WriteLine(ftp.LastErrorText)
    WScript.Quit
End If