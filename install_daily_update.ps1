$ErrorActionPreference = "Stop"
$taskName = "Mega645 Daily Data Update"
Write-Host "CAI TU DONG CAP NHAT MEGA 6/45 HANG NGAY" -ForegroundColor Cyan
$exe = Read-Host "Nhap duong dan day du den file Mega 6/45 Analyzer.exe"
$exe = $exe.Trim('"')
if (-not (Test-Path -LiteralPath $exe)) {
  Write-Host "Khong tim thay file: $exe" -ForegroundColor Red
  Write-Host "Hay cai phan mem Windows truoc, sau do chay lai script nay."
  exit 1
}
$action = New-ScheduledTaskAction -Execute $exe -Argument "--update-only"
$trigger = New-ScheduledTaskTrigger -Daily -At 8:30PM
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Minutes 5)
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Limited
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Description "Tai du lieu lich su Mega 6/45 moi hang ngay luc 20:30 khi may tinh bat va tai khoan da dang nhap." -Force | Out-Null
Write-Host "Da tao tac vu '$taskName'." -ForegroundColor Green
Write-Host "Tac vu chay moi ngay luc 20:30. Neu may tinh tat, Windows se chay bu khi co the khi dang nhap."
Read-Host "Nhan Enter de dong"
