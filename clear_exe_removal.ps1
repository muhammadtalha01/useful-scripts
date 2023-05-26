# Stop Clear/Clearbrowser processes
if (Get-Process -Name Clear -ErrorAction SilentlyContinue) {
   Write-Output "Clear Processes found...terminating"
   Stop-Process -Name Clear -Force -ErrorAction SilentlyContinue
}
else {
   Write-Output "No Clear Processs found"
}
if (Get-Process -Name clearbrowser -ErrorAction SilentlyContinue) {
   Write-Output "clearbrowser Processes found...terminating"
   Stop-Process -Name clearbrowser -Force -ErrorAction SilentlyContinue
}
else {
   Write-Output "No clearbrowser Processs found"
}
# Remove Clear Directory and files
if ($clearFolder1 = Get-Item "C:\Users\*\AppData\Local\Programs\Clear*" -ErrorAction SilentlyContinue) {
   Write-Output "Clear found at $($clearFolder1.FullName)...removing"
   Remove-Item "C:\Users\*\AppData\Local\Programs\Clear*" -Force -Recurse -ErrorAction SilentlyContinue
}
else {
   Write-Output "No Clear files found in 'C:\Users\*\AppData\Local\Programs\Clear*'"
}
if ($clearFolder2 = Get-Item "C:\Users\*\Downloads\Clear*" -ErrorAction SilentlyContinue) {
   Write-Output "Clear found at $($clearFolder2.FullName)...removing"
   Remove-Item "C:\Users\*\Downloads\Clear*" -Force -Recurse -ErrorAction SilentlyContinue
}
else {
   Write-Output "No Clear files found in 'C:\Users\*\Downloads\Clear*'"
}
# Remove Scheduled Task
if (Get-ScheduledTask -TaskName ClearbarStartAtLoginTask* -ErrorAction SilentlyContinue) {
   Write-Output "Scheduled task found...removing"
   Unregister-ScheduledTask -TaskName ClearbarStartAtLoginTask* -confirm:$false -ErrorAction SilentlyContinue
}
else {
   Write-Output "ClearbarStartAtLoginTask scheduled task was not found"
}
if (Get-ScheduledTask -TaskName ClearbarUpdateChecker* -ErrorAction SilentlyContinue) {
   Write-Output "Scheduled task found...removing"
   Unregister-ScheduledTask -TaskName ClearbarUpdateChecker* -confirm:$false -ErrorAction SilentlyContinue
}
else {
   Write-Output "ClearbarUpdateChecker* scheduled task was not found"
}