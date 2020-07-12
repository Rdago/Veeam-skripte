function Get-WeekOfYear([datetime]$date){
    $local = [System.Globalization.DateTimeFormatInfo]::CurrentInfo
    return $local.Calendar.GetWeekOfYear($date,$local.CalendarWeekRule,$local.FirstDayOfWeek)
}
 
# Kalenderwoche es aktuellen Datums holen
$currentKW = Get-WeekOfYear (get-date)
 
if( ($currentKW % 2) -eq 0 ){
# Gerade KW
    Add-PSSnapin VeeamPSSnapIn
    get-vbrjob -Name "WeeklyBackup_Gerade KW*" | start-vbrjob
}else{
# Ungerade KW
    Add-PSSnapin VeeamPSSnapIn
    get-vbrjob -Name "WeeklyBackup_Ungerade KW*" | start-vbrjob
}
