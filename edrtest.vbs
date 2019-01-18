Option Explicit
dim objFSO, objFile, objShell, InputFile, ZipFile, hdrary, strbuf, ZipItemCount, i
if WScript.Arguments.Count < 2 then
    WScript.Echo "Usage: CScript.exe edrtest.vbs ZIPFile InputFiles..."
    WScript.Quit
end if
ZipFile=WScript.Arguments.Item(0)
hdrary = Array(80, 75, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)  'zipファイルのヘッダ情報
For i = 0 To UBound(hdrary)
  strbuf = strbuf & Chr(hdrary(i))
Next
Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.CreateTextFile(ZipFile, True)
objFile.Write(strbuf)
objFile.Close
Set objFile = Nothing
Set objFSO = Nothing
Set objShell = CreateObject("Shell.Application")
Set objFile = objShell.NameSpace(ZipFile)
ZipItemCount = objFile.Items().Count
for i = 1 to WScript.Arguments.Count - 1
    InputFile = WScript.Arguments.Item(i)
    objFile.CopyHere(InputFile)
    Do While ZipItemCount = objFile.Items().count
        WScript.Sleep(250)
    Loop
    ZipItemCount = ZipItemCount + 1
next
Set objFile = Nothing
Set objShell = Nothing
