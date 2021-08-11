
function Get-Temperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    Write-Output $t
    
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature)
    {

    $currentTempKelvin = $temp / 10
    $currentTempCelsius = $currentTempKelvin - 273.15

    $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32

    $returntemp += $currentTempCelsius.ToString() + " C : " + $currentTempFahrenheit.ToString() + " F : " + $currentTempKelvin + "K"  
    }
    cls
    $t = $null
    $temp = $null
    return $returntemp
    $returntemp = $null    
    
}
for (;;){
Get-Temperature
Start-Sleep -Seconds 2
}