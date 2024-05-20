for _, v in pairs(SCHEMA.beepSounds) do
    for _, v2 in ipairs(v.on) do
        util.PrecacheSound(v2)
    end

    for _, v2 in ipairs(v.off) do
        util.PrecacheSound(v2)
    end
end

for _, v in pairs(SCHEMA.deathSounds) do
    for _,, v2 in ipairs(v) do
        util.PrecacheSound(v2)
    end
end

for _, v in pairs(SCHEMA.painSounds) do
    for _, v2 in ipairs(v) do
        util.PrecacheSound(v2)
    end
end

for _, v in pairs(SCHEMA.rankModels) do
    lia.anim.setModelClass(v, "metrocop")
    player_manager.AddValidModel("combine", v)
    util.PrecacheModel(v)
end
