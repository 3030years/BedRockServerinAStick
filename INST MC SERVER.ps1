// PARAMS -----
$mc_ver = "1.20.1.02"
Write-Host "IPAddress (And other debug stuff. You only need IPAddress): "
Write-Host $(Get-NetIPAddress -AddressFamily Ipv4 -PrefixOrigin Dhcp | Out-Host)


cd $env:temp
$tempstr = Get-Random

mkdir $tempstr
Write-Host $tempstr
cd $tempstr

Invoke-WebRequest https://minecraft.azureedge.net/bin-win/bedrock-server-$mc_ver.zip -OutFile "BedServer-$mc_ver.zip"
Expand-Archive "./BedServer-$mc_ver.zip" -DestinationPath "./BedRockServer"
del "./BedServer-$mc_ver.zip"
cd .\BedRockServer
Start-Process .\bedrock_server.exe -Wait
cd ../..
del $tempstr -Recurse -Force
