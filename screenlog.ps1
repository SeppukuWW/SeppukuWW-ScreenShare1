[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host ''
Write-Host 'by DEABLOV111  screenshare toolkit' -ForegroundColor Gray
Write-Host ' SSSSS  SSSSSS   SSSS  SSSSS  SS       SSSSS  SS    SSSS SS  SS SS' -ForegroundColor Red
Write-Host 'SS      SS      SS  SS SS  SS SS      SS    SS    SS  SSSS SS SS' -ForegroundColor Red
Write-Host 'SS      SSSSS   SSSSSS SSSSS  SS      SS    SS    SS  SSSS SS SS' -ForegroundColor Red
Write-Host 'SS      SS      SS  SS SS  SS SS      SS     SS  SS   SSSS SS SS' -ForegroundColor Red
Write-Host ' SSSSS  SSSSSS  SS  SS SSSSS  SSSSSS  SSSSS   SSSS    SS  SS SS SS' -ForegroundColor Red
Write-Host ''
Write-Host '  FILE LOGS (Changes and Deletions)' -ForegroundColor Red
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=@(1102, 4660, 4663)} -MaxEvents 15 -ErrorAction SilentlyContinue
Write-Host ''
Write-Host (' {0,-10} | {1,-8} | {2,-15} | {3}' -f 'DATE', 'TIME', 'OPERATION', 'FILE') -ForegroundColor Gray
Write-Host (' ' + '-'*60) -ForegroundColor DarkGray
if ($events) {
    foreach ($e in $events) {
        $date = $e.TimeCreated.ToString('dd.MM.yyyy')
        $time = $e.TimeCreated.ToString('HH:mm:ss')
        $op = if($e.Id -eq 1102){'Log Cleared'}elseif($e.Id -eq 4660){'Deleted'}else{'Modified'}
        $file = if($e.Id -eq 1102){'SYSTEM'}else{[System.IO.Path]::GetFileName($e.Properties.Value)}
        Write-Host (' {0,-10} | {1,-8} | {2,-15} | {3}' -f $date, $time, $op, $file) -ForegroundColor White
    }
} else {
    Write-Host '   [No events found]' -ForegroundColor Yellow
}

