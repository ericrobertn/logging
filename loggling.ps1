# Begin logging
$VerbosePreference = "Continue"
$LogPath = "C:\TotallyReal\DefinitelyAFolder\"
Get-ChildItem "$LogPath\*.log" | Where LastWriteTime -LT (Get-Date).AddDays(-15) | Remove-Item -Confirm:$false
$LogPathName = "$($LogPath)FTP-$(Get-Date -Format 'MM-dd-yyyy').log"
Start-Transcript $LogPathName -Append

# Define function to stop logging and exit script
Function Exit-Script {
 If ($PSItem) {
 Write-Output "ERROR: $PSItem"
 }
Stop-Transcript
Exit
}
