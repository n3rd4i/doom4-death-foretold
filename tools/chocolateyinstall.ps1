$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"
. "$(Join-Path $toolsDir dependenciesEnv.ps1)"

## Install Doom4: Death Foretold
$url = Get-ModdbDlUrl 'https://www.moddb.com/downloads/start/185359'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $installLocation
  url           = $url
  checksum      = 'A293E813E9AE73D8CC2FDA4B41D183C23552A0EC173367452E9F74A8DB16F99E'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## Download & Convert game shortcuts icon
$iconName = 'D4T_logo.ico'
$iconPath = "$(Join-Path $toolsDir $iconName)"
Get-ChocolateyWebFile -PackageName $iconName `
  -FileFullPath $iconPath `
  -Url 'http://www.iconarchive.com/download/i1894/3xhumed/mega-games-pack-40/Doom-4-1.ico' `
  -Checksum '7C8F535E81E89FFB8310CCC0A87EE6146992CF95526D9F8DDA0835F25D3967A6' `
  -ChecksumType 'sha256'

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $pk3_lnk DEL /S /Q $pk3_lnk

# Install symbolic link for later use
$pk3_src = "$(Join-Path $installLocation $ModPack)"
& $ENV:COMSPEC /C MKLINK $pk3_lnk $pk3_src

## StartMenu shortcuts
Install-ChocolateyShortcut "$(Join-Path $startMenuDir 'D4T Guide v2.5.lnk')" `
  -TargetPath "$(Join-Path $installLocation 'D4T Guide v2.5.rtf')"
Install-ChocolateyShortcut "$(Join-Path $startMenuDir 'D4T Changelog v2.5.lnk')" `
  -TargetPath "$(Join-Path $installLocation 'D4T Changelog v2.5.txt')"
Install-ChocolateyShortcut "$(Join-Path $startMenuDir 'D4T Readme v2.5.lnk')" `
  -TargetPath "$(Join-Path $installLocation 'D4T Readme v2.5.txt')"

Install-ChocolateyShortcut "$(Join-Path $startMenuDir 'Doom4 - Death Foretold (Doom1).lnk')" `
  -TargetPath "$zandronum" -Arguments "$ModPack $D4T_KEYSNCORPSES -iwad $iWAD1" `
  -WorkingDirectory "$installLocation" -IconLocation "$iconPath"

Install-ChocolateyShortcut "$(Join-Path $startMenuDir 'Doom4 - Death Foretold (Doom2).lnk')" `
  -TargetPath "$zandronum" -Arguments "$ModPack $D4T_KEYSNCORPSES -iwad $iWAD2" `
  -WorkingDirectory "$installLocation" -IconLocation "$iconPath"
