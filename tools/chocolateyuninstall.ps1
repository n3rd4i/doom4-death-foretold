$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

& $ENV:COMSPEC /C IF EXIST $pk3_lnk DEL /S /Q $pk3_lnk

Remove-Item "$startMenuDir" -recurse -force
Remove-Item $installLocation -recurse -force
