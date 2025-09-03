' StartAlexaKiller_portable.vbs
Option Explicit
Dim sh, fso, here, ps1, cmd
Set sh  = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

here = fso.GetParentFolderName(WScript.ScriptFullName)
ps1 = fso.BuildPath(here, "AlexaKiller.ps1")

If Not fso.FileExists(ps1) Then
  WScript.Echo "PS1 non trovato: " & ps1
  WScript.Quit 1
End If

cmd = "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File " & Chr(34) & ps1 & Chr(34)
sh.Run cmd, 0, False