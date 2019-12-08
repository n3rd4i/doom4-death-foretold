## Common between Install and Uninstall
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$AppName = 'Doom4 - Death Foretold'
$installLocation = "$(Join-Path $toolsDir $AppName)"
$startMenuDir = [IO.Path]::Combine($ENV:ProgramData, 'Microsoft\Windows\Start Menu\Programs', $AppName)
# $shortcutPath = [IO.Path]::Combine($ENV:UserProfile, 'Desktop', "$GameName.lnk")

$ModPack = "D4Tv2.5.pk3"
# $D4Tsprites = 'QCDE D4T New Sprites v1.1.1.pk3'
