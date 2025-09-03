# AlexaSilenzio.ps1
# Keeps the Bluetooth connection with Alexa alive
# Plays 1 second of silence every 10 minutes

# Preparation of silent WAV file
# The file will be saved in USER
$silencePath = "$env:USERPROFILE\silenzio.wav"
if (-not (Test-Path $silencePath)) {
    $wavHeader = [byte[]](
        0x52,0x49,0x46,0x46,0x24,0x08,0x00,0x00,0x57,0x41,0x56,0x45,
        0x66,0x6D,0x74,0x20,0x10,0x00,0x00,0x01,0x00,0x01,0x00,
        0x44,0xAC,0x00,0x00,0x88,0x58,0x01,0x00,0x02,0x00,0x10,0x00,
        0x64,0x61,0x74,0x61,0x00,0x08,0x00,0x00
    )
    $wavData = New-Object byte[] (2048) # 1 sec di silenzio (0)
    [System.IO.File]::WriteAllBytes($silencePath, $wavHeader + $wavData)
}

# MediaPlayer Loader
Add-Type -AssemblyName presentationCore
$player = New-Object System.Windows.Media.MediaPlayer

#Write-Output "AlexaSilenzio avviato. Verrà riprodotto 1s di silenzio ogni 10 minuti."
#Write-Output "Chiudi la finestra per interrompere."

while ($true) {
    try {
        $player.Open([Uri]$silencePath)
        $player.Play()
        Start-Sleep -Seconds 2   # Waiting time for second
        $player.Stop()
    } catch {
        Write-Output "Errore durante la riproduzione: $_"
    }
    Start-Sleep -Seconds 600    # 600 seconds = 10 minutes
}
