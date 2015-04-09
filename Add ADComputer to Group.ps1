$Content = Get-Content "SOME LIST HERE"
$Group = Get-ADGroup -Identity "SOME GROUP HERE"
$GroupDN = $Group.DistinguishedName
foreach ($PC in $Content) 
{
    $Computer = Get-ADComputer -Identity $PC
    $ComputerDN = $Computer.DistinguishedName
    
    Add-ADGroupMember $GroupDN -Members $ComputerDN
}
