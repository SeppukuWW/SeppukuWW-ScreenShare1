[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host ''
Write-Host 'by DEABLOV111  screenshare toolkit' -ForegroundColor Gray
Write-Host ''
Write-Host '  ____  _  __  __    _    ____  ____      _  __' -ForegroundColor Red
Write-Host ' / ___|| |/ / | |   / \  / ___||  _ \    | |/ /' -ForegroundColor Red
Write-Host ' \___ \|  /  | |  / _ \| |    | |_) |   |   /' -ForegroundColor Red
Write-Host '  ___) |  \  | | / ___ \ |___ |  _ <    |  \' -ForegroundColor Red
Write-Host ' |____/|_|\_\ |_|/_/   \_\____||_| \_\   |_|\_\' -ForegroundColor Red
Write-Host ''
Write-Host '  FILE LOGS (Changes and Deletions)' -ForegroundColor Red
Write-Host ''
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=@(1102, 4660, 4663)} -MaxEvents 15 -ErrorAction SilentlyContinue
Write-Host (' {0,-12} | {1,-10} | {2,-15} | {3}' -f 'DATE', 'TIME', 'OPERATION', 'FILE') -ForegroundColor Gray
Write-Host (' ' + '-'*65) -ForegroundColor DarkGray
if ($events) {
    foreach ($e in $events) {
        $date = $e.TimeCreated.ToString('dd.MM.yyyy')
        $time = $e.TimeCreated.ToString('HH:mm:ss')
        $op = if($e.Id -eq 1102){'Log Cleared'}elseif($e.Id -eq 4660){'Deleted'}else{'Modified'}
        $file = if($e.Id -eq 1102){'SYSTEM'}else{[System.IO.Path]::GetFileName($e.Properties.Value)}
        Write-Host (' {0,-12} | {1,-10} | {2,-15} | {3}' -f $date, $time, $op, $file) -ForegroundColor White
    }
} else {
    Write-Host '   [No events found]' -ForegroundColor Yellow
}
