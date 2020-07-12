# Hole den Monat und rechne Modulo 2
$monat = (Get-Date -UFormat %m) % 2
 
if($monat -eq 0){
# Gerader Monat
    Add-PSSnapin VeeamPSSnapIn
    get-vbrjob -Name "*USB-GKM*" | start-vbrjob
}else{
# ungerader Monat
    Add-PSSnapin VeeamPSSnapIn
    start-vbrjob -Name "*USB-UKM*" | start-vbrjob
}
