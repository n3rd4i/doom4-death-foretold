## Common between Install and Uninstall
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$AppName = 'Doom4 - Death Foretold'
$installLocation = "$(Join-Path $toolsDir $AppName)"
$startMenuDir = [IO.Path]::Combine($ENV:ProgramData, 'Microsoft\Windows\Start Menu\Programs', $AppName)
# $shortcutPath = [IO.Path]::Combine($ENV:UserProfile, 'Desktop', "$GameName.lnk")

$ModPack = "D4Tv2.5.pk3"
$DOOM2016_OST = 'DOOM2016_OST_D4T.wad'
$D4T_KEYSNCORPSES = 'STR_D4T_Keys_N_Corpses_v1.pk3'
