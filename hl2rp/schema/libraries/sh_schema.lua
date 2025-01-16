function SCHEMA:CanPlayerEditData(client)
    if client:isCombine() then return true end
    return false
end

function SCHEMA:isCombineFaction(faction)
    return faction == FACTION_CP or faction == FACTION_OW
end

function SCHEMA:isDispatch(client)
    return client:isCombineRank(self.eliteRanks) or client:isCombineRank(self.scnRanks)
end

function EmitQueuedSounds(entity, sounds, delay, spacing, volume, pitch)
    delay = delay or 0
    spacing = spacing or 0.1
    for _, v in ipairs(sounds) do
        local postSet, preSet = 0, 0
        if istable(v) then
            postSet, preSet = v[2] or 0, v[3] or 0
            v = v[1]
        end

        local length = SoundDuration(SoundDuration("npc/metropolice/pain1.wav") > 0 and "" or "../../hl2/sound/" .. v)
        delay = delay + preSet
        timer.Simple(delay, function() if IsValid(entity) then entity:EmitSound(v, volume, pitch) end end)
        delay = delay + length + postSet + spacing
    end
    return delay
end
