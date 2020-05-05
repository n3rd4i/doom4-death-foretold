$zandronumLocation = "$ENV:ZANDRONUM_INSTALL_DIR"
$zandronum = "$(Join-Path $zandronumLocation 'zandronum.exe')"

# located in $ENV:DOOMWADDIR
$iWAD1 = "freedoom1.wad"
$iWAD2 = "freedoom2.wad"

$D4T_ADDON_PATH = [IO.Path]::Combine($ENV:ChocolateyInstall, 'lib', 'd4t-addons-keysncorpses', 'tools', 'keysncorpses')
$D4T_KEYSNCORPSES = "$(Join-Path $D4T_ADDON_PATH 'STR_D4T_Keys_N_Corpses_v1.pk3')"
