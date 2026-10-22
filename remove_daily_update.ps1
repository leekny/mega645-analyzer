$taskName = "Mega645 Daily Data Update"
Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction SilentlyContinue
Write-Host "Da xoa tac vu cap nhat tu dong (neu ton tai)."
Read-Host "Nhan Enter de dong"
