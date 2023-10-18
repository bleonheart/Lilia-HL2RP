PLUGIN.name = "Flashlight"
PLUGIN.author = "STEAM_0:1:176123778"
PLUGIN.desc = "Provides a flashlight item to regular flashlight usage."

function PLUGIN:PlayerSwitchFlashlight(client, state)
	local character = client:getChar()

	if (!character or !character:getInv()) then
		return false
	end

	if (character:getInv():hasItem("flashlight")) then
		return true
	end
end