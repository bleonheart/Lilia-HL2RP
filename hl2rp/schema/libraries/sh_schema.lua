function SCHEMA:CanPlayerEditData(client, target)
    if client:isCombine() then return true end
    return false
end

function SCHEMA:isCombineFaction(faction)
    return faction == FACTION_CP or faction == FACTION_OW
end

function SCHEMA:isDispatch(client)
    return client:isCombineRank(self.eliteRanks) or client:isCombineRank(self.scnRanks)
end
