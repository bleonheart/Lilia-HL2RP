PLUGIN.name = "Business Permits"
PLUGIN.desc = "Adds business permits which are needed to purchase certain goods."
PLUGIN.author = "STEAM_0:1:176123778"

function PLUGIN:CanPlayerUseBusiness(client, uniqueID)
	local itemTable = lia.item.list[uniqueID]
	if (itemTable and itemTable.permit) then
		if (client:getChar():getInv():hasItem("permit_"..itemTable.permit)) then
			return true
		end
	end
end