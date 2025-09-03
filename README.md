# AlexaKiller (keep Alexa Bluetooth alive)

This small tool prevents an Echo device used as a **Windows Bluetooth speaker** from saying  
the annoying phrase *"Playing from device"* after long periods of inactivity.  
It works by playing **1 second of silence every 10 minutes** – just enough to keep the connection alive,  
without generating any audible sound.

> ⚠️ Works **only on Windows** and requires PowerShell (built-in) and the .NET/WPF subsystem available by default on Windows 10/11 desktop editions.

---

## How it works

- `AlexaKiller.ps1` creates (if it doesn’t exist) a silent WAV file and uses  
  `System.Windows.Media.MediaPlayer` to play **1–2 seconds** of silence.
- Then it loops forever: **play → wait 10 minutes → repeat**.
- `AlexaKiller.vbs` is a *launcher* that runs the PowerShell script **hidden** with  
  `-ExecutionPolicy Bypass`, so no console window appears and execution policies don’t block it.

---

## Requirements

- Windows 10/11
- Standard user permissions (no admin required)
- Bluetooth already paired with the Echo device as an audio output

---

## Quick install

1. **Clone or download** this repository.
2. Place `AlexaKiller.ps1` and `AlexaKiller.vbs` in the **same folder** (e.g. `C:\Tools\AlexaKiller`).

## Quick Start

1. Run .vbs file
2. enjoy

## Uninstall

End any running instance via Task Manager (wscript.exe if launched through VBS).

Remove the scheduled task or Startup shortcut.

Delete the app folder. The script also creates silenzio.wav in your user folder – you can remove it.
