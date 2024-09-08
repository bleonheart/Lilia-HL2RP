local SCHEMA = SCHEMA
local playerMeta = FindMetaTable("Player")
function playerMeta:isCombine()
    return SCHEMA:isCombineFaction(self:Team())
end

function playerMeta:getCombineRank()
    local rankTables = SCHEMA.rankTables[self:Team()]
    if not rankTables then return end
    local name = self:Name()
    for _, ranks in ipairs(rankTables) do
        for _, rank in ipairs(ranks) do
            if name:find(rank, 1, true) then return rank end
        end
    end
end

function playerMeta:isCombineRank(rank)
    if type(rank) == "table" then
        local name = self:Name()
        for _, rank in ipairs(rank) do
            if name:find(rank .. ".", 1, true) then return rank end
        end
        return false
    else
        return self:getCombineRank() == rank
    end
end

function playerMeta:getDigits()
    if self:isCombine() then
        local name = self:Name():reverse()
        local digits = name:match("(%d+)")
        if digits then return tostring(digits):reverse() end
    end
    return "UNKNOWN"
end

if SERVER then
    function playerMeta:addDisplay(text, color)
        if self:isCombine() then netstream.Start(self, "cDisp", text, color) end
    end

    function SCHEMA:addDisplay(text, color)
        local receivers = {}
        for _, v in player.Iterator() do
            if v:isCombine() then receivers[#receivers + 1] = v end
        end

        netstream.Start(receivers, "cDisp", text, color)
    end
end
