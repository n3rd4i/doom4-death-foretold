## Common between Install and Uninstall
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$AppName = 'Doom4 - Death Foretold'

$installLocation = "$(Join-Path $toolsDir $AppName)"
$startMenuDir = [IO.Path]::Combine($ENV:ProgramData, 'Microsoft\Windows\Start Menu\Programs', $AppName)

$ModPack = "D4Tv2.5.pk3"
