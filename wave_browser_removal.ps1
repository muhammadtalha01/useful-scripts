# Make Test file
write-output test123 | out-file test.csv 
 # Stop Wave Browser Processes
if (Get-Process -Name wavebrowser -ErrorAction SilentlyContinue) {
   Write-Output "wavebrowser Processes found...terminating"
   Stop-Process -Name wavebrowser -Force -ErrorAction SilentlyContinue
}
else {
   Write-Output "No wavebrowser Processs found"
}
# Remove wavebrowser Directory and files
if ($wavebrowserFolder1 = Get-Item "C:\Users\*\AppData\Local\wavebrowser*" -ErrorAction SilentlyContinue) {
   Write-Output "wavebrowser found at $($wavebrowserFolder1.FullName)...removing"
   Remove-Item "C:\Users\*\AppData\Local\wavebrowser*" -Force -Recurse -ErrorAction SilentlyContinue
}
else {
   Write-Output "No wavebrowser files found in 'C:\Users\*\AppData\Local\wavebrowser*'"
}
if ($wavebrowserFolder2 = Get-Item "C:\Users\*\Wavesor Software*" -ErrorAction SilentlyContinue) {
   Write-Output "wavebrowser found at $($wavebrowserFolder2.FullName)...removing"
   Remove-Item "C:\Users\*\Wavesor Software*" -Force -Recurse -ErrorAction SilentlyContinue
}
else {
   Write-Output "No wavebrowser files found in 'C:\Users\*\Wavesor Software*'"
}
if ($wavebrowserDownload = Get-Item "C:\Users\*\Downloads\Wave Browser_*" -ErrorAction SilentlyContinue) {
   Write-Output "wavebrowser installers found at $($wavebrowserDownload.FullName)...removing"
   Remove-Item "C:\Users\*\Downloads\Wave Browser_*" -Force -Recurse -ErrorAction SilentlyContinue
}
else {
   Write-Output "No wavebrowser files found in 'C:\Users\*\Downloads*'"
}
# Remove Scheduled Task
if (Get-ScheduledTask -TaskName WavesorSWUpdater* -ErrorAction SilentlyContinue) {
   Write-Output "Scheduled task found...removing"
   Unregister-ScheduledTask -TaskName WavesorSWUpdater* -confirm:$false -ErrorAction SilentlyContinue
}
else {
   Write-Output "WavesorSWUpdater* scheduled task was not found"
}
if (Get-ScheduledTask -TaskName WaveBrowser-StartAtLogin* -ErrorAction SilentlyContinue) {
   Write-Output "Scheduled task found...removing"
   Unregister-ScheduledTask -TaskName WaveBrowser-StartAtLogin* -confirm:$false -ErrorAction SilentlyContinue
}
else {
   Write-Output "WaveBrowser-StartAtLogin* scheduled task was not found"

}
