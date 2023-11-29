--------------------------------------------------------------------------------------------------------
FACTION.name = "Overwatch Transhuman Arm"
--------------------------------------------------------------------------------------------------------
FACTION.desc = "The OverWatch"
--------------------------------------------------------------------------------------------------------
FACTION.color = Color(181, 94, 94)
--------------------------------------------------------------------------------------------------------
FACTION.isDefault = false
--------------------------------------------------------------------------------------------------------
FACTION.pay = 0
--------------------------------------------------------------------------------------------------------
FACTION.isGloballyRecognized = true
--------------------------------------------------------------------------------------------------------
FACTION.models = {"models/nemez/combine_soldiers/combine_soldier_pm.mdl"}
--------------------------------------------------------------------------------------------------------
function FACTION:onGetDefaultName(client, digits)
	if SCHEMA.digitsLen >= 1 then
		digits = digits or math.random(tonumber("1" .. string.rep("0", SCHEMA.digitsLen - 1)), tonumber(string.rep("9", SCHEMA.digitsLen)))
		local name = SCHEMA.owPrefix .. SCHEMA.owDefaultRank .. "." .. digits

		return name, true
	else
		return SCHEMA.owPrefix .. SCHEMA.owDefaultRank, true
	end
end

--------------------------------------------------------------------------------------------------------
function FACTION:onTransfered(client, oldFaction)
	local digits
	if oldFaction == nil then return end
	local inventory = client:getChar():getInv()
	if oldFaction.index == FACTION_CITIZEN and inventory then
		for _, item in pairs(inventory:getItems()) do
			if item.uniqueID == "cid" and item:getData("id") then
				digits = item:getData("id")
				break
			end
		end
	elseif oldFaction.index == FACTION_CP then
		digits = client:getDigits()
	elseif oldFaction.index == FACTION_OW then
		return
	end

	client:getChar():setName(self:onGetDefaultName(client, digits))
	hook.Run("PlayerLoadout", client)
end

--------------------------------------------------------------------------------------------------------
FACTION_OW = FACTION.index
--------------------------------------------------------------------------------------------------------