PLUGIN.name = "Player Scanners Util"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Adds functions that allow players to control scanners."
lia.config.PictureDelay = 15
if CLIENT then
	PLUGIN.PICTURE_WIDTH = 580
	PLUGIN.PICTURE_HEIGHT = 420
end

lia.util.include("sv_photos.lua")
lia.util.include("cl_photos.lua")
lia.util.include("sv_hooks.lua")
lia.util.include("cl_hooks.lua")