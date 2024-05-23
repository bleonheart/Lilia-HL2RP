local playerMeta = FindMetaTable("Player")
function playerMeta:addDisplay(text, color)
    if self:isCombine() then netstream.Start(self, "cDisp", text, color) end
end

function SCHEMA:addDisplay(text, color)
    local receivers = {}
    for _, v in ipairs(player.GetAll()) do
        if v:isCombine() then receivers[#receivers + 1] = v end
    end

    netstream.Start(receivers, "cDisp", text, color)
end
