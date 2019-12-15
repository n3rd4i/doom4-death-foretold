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

## Install doom-d4t-accurate-music-addon
## https://www.moddb.com/mods/death-foretold/addons/doom-d4t-accurate-music-addon
$url = Get-ModdbDlUrl 'https://www.moddb.com/addons/start/174491'
$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName" + "DOOM2016_OST"
  unzipLocation = $installLocation
  url           = $url
  checksum      = '6F3D92CBEE24DC5009C323F83B919D9DEC187FE14D84134DD46B4353020CC0C0'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## Install d4t-keysncorpses
# https://www.moddb.com/mods/death-foretold/addons/d4t-keysncorpses
$url = Get-ModdbDlUrl 'https://www.moddb.com/addons/start/186106'
$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName" + "KEYSNCORPSES"
  unzipLocation = $installLocation
  url           = $url
  checksum      = '0E51B782B26F41C7FCFB1EAA29D4EA9D77A255A84C362A34A8781590F535D7A3'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs


## Download & Convert game shortcuts icon
## https://zdoom.org/w/images/thumb/a/af/QCDE_logo.png/120px-QCDE_logo.png
$iconSrc = 'D4T_logo.png'
$iconSrcPath = "$(Join-Path $ENV:TEMP $iconSrc)"
Get-ChocolateyWebFile -PackageName $iconSrc `
  -FileFullPath $iconSrcPath `
  -Url 'https://cdn.statically.io/img/media.moddb.com/cache/images/downloads/1/186/185359/thumb_620x2000/D4T-.png' `
  -Checksum '55930B8E53087E9ABCA9CD47EBB520C751EC48D86D6E3814E9180581AEF63C2B' `
  -ChecksumType 'sha256'
$iconName = 'D4T_logo.ico'
$iconPath = "$(Join-Path $toolsDir $iconName)"
& png2ico.exe $iconPath $iconSrcPath


## StartMenu shortcuts
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir 'D4T Guide v2.5.lnk')" `
  -TargetPath "$(Join-Path $installLocation 'D4T Guide v2.5.rtf')"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir 'D4T Changelog v2.5.lnk')" `
  -TargetPath "$(Join-Path $installLocation 'D4T Changelog v2.5.txt')"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir 'D4T Readme v2.5.lnk')" `
  -TargetPath "$(Join-Path $installLocation 'D4T Readme v2.5.txt')"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$(Join-Path $startMenuDir 'Doom4 - Death Foretold.lnk')" `
  -TargetPath "$zandronum" `
  -Arguments "$ModPack $D4T_KEYSNCORPSES -file $DOOM2016_OST -iwad $iWAD2" `
  -WorkingDirectory "$installLocation"
  -IconLocation "$iconPath"
