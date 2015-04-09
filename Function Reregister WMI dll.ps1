$PC = 'SomePC Name'
Invoke-Command -ScriptBlock ${function:Fixwmi} -ComputerName $PC
Invoke-Command -ComputerName $pc -ScriptBlock {Start-Service -Name CcmExec}



Function FixWMI (){
    Set-Service -Name Winmgmt -StartupType Disabled
    Stop-Service -Name Winmgmt -Force
    $wbem =  'C:\Windows\System32\wbem'
    Set-Service -Name Winmgmt -StartupType Automatic
    Start-Service -Name Winmgmt
    Start-Sleep -Seconds 10
    $mofget = Get-ChildItem -Path $wbem -Name '*.mof'
    Foreach ($mof in $mofget)
    {
    & c:\windows\system32\wbem\mofcomp.exe "$wbem\$mof"}
    }
