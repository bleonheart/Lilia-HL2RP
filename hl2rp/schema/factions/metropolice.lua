FACTION.name = "Civil Protection Forces"
FACTION.desc = "fCopDesc"
FACTION.color = Color(25, 30, 180)
FACTION.isDefault = false
FACTION.models = {"models/dannio/pmcitizen/urbanmetrocop/male_merged.mdl"}
FACTION.weapons = {"lia_stunstick"}
FACTION.pay = 50
FACTION.isGloballyRecognized = true
function FACTION:OnGetDefaultName(_, digits)
    if SCHEMA.digitsLen >= 1 then
        digits = digits or math.random(tonumber("1" .. string.rep("0", SCHEMA.digitsLen - 1)), tonumber(string.rep("9", SCHEMA.digitsLen)))
        local name = SCHEMA.cpPrefix .. next(SCHEMA.rctRanks) .. "." .. digits
        return name, true
    else
        return SCHEMA.cpPrefix .. next(SCHEMA.rctRanks), true
    end
end

function FACTION:OnTransfered(client, oldFaction)
    local digits
    if oldFaction == nil then return end
    if oldFaction.index == FACTION_CITIZEN then
        local inventory = client:getChar():getInv()
        if inventory then
            for _, item in pairs(inventory:getItems()) do
                if item.uniqueID == "cid" and item:getData("id") then
                    digits = item:getData("id")
                    break
                end
            end
        end
    elseif oldFaction.index == FACTION_OW then
        digits = client:getDigits()
    elseif oldFaction.index == FACTION_CP then
        return
    end

    client:getChar():setName(self:OnGetDefaultName(client, digits))
    hook.Run("PlayerLoadout", client)
end

FACTION_CP = FACTION.index
