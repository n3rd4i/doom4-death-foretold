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
  -Arguments "$ModPack -iwad $iWAD2" `
  -WorkingDirectory "$installLocation"
  # -IconLocation "$(Join-Path $toolsDir 'assets\playa2a8.ico')" `
  # -IconLocation "$iconPath"
