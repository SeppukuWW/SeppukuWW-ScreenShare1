Write-Host 'by DEABLOV111  screenshare toolkit' -ForegroundColor Gray
Write-Host '██████╗ ███████╗ █████╗ ██████╗ ██╗      ██████╗ ██╗   ██╗██╗██╗██╗' -ForegroundColor Red
Write-Host '██╔══██╗██╔════╝██╔══██╗██╔══██╗██║     ██╔═══██╗██║   ██║██║██║██║' -ForegroundColor Red
Write-Host '██║  ██║█████╗  ███████║██████╔╝██║     ██║   ██║██║   ██║██║██║██║' -ForegroundColor Red
Write-Host '██║  ██║██╔══╝  ██╔══██║██╔══██╗██║     ██║   ██║╚██╗ ██╔╝╚═╝╚═╝╚═╝' -ForegroundColor Red
Write-Host '██████╔╝███████╗██║  ██║██████╔╝███████╗╚██████╔╝ ╚████╔╝ ██╗██╗██╗' -ForegroundColor Red
Write-Host '╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝╚═╝' -ForegroundColor Red
Write-Host '  ■ FILE LOGS (Changes & Deletions)' -ForegroundColor Red

$events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=@(1102, 4660, 4663)} -MaxEvents 15 -ErrorAction SilentlyContinue

Write-Host (' {0,-10} | {1,-8} | {2,-15} | {3}' -f 'ДАТА', 'ВРЕМЯ', 'ОПЕРАЦИЯ', 'ИМЯ ФАЙЛА') -ForegroundColor Gray
Write-Host (' ' + '-'*88) -ForegroundColor DarkGray

if ($events) {
    foreach ($e in $events) {
        $date = $e.TimeCreated.ToString('dd.MM.yyyy')
        $time = $e.TimeCreated.ToString('HH:mm:ss')
        $op = if($e.Id -eq 1102){'Журнал очищен'}elseif($e.Id -eq 4660){'Удаление'}else{'Изменение'}
        $file = if($e.Id -eq 1102){'SYSTEM'}else{[System.IO.Path]::GetFileName($e.Properties.Value)}
        Write-Host (' {0,-10} | {1,-8} | {2,-15} | {3}' -f $date, $time, $op, $file) -ForegroundColor White
    }
} else {
    Write-Host '   [Нет событий. Удалите или переименуйте файл для проверки]' -ForegroundColor Yellow
}


