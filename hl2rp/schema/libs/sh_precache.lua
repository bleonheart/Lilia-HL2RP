for k, v in pairs(SCHEMA.beepSounds) do
	for k2, v2 in ipairs(v.on) do
		util.PrecacheSound(v2)
	end

	for k2, v2 in ipairs(v.off) do
		util.PrecacheSound(v2)
	end
end

for k, v in pairs(SCHEMA.deathSounds) do
	for k2, v2 in ipairs(v) do
		util.PrecacheSound(v2)
	end
end

for k, v in pairs(SCHEMA.painSounds) do
	for k2, v2 in ipairs(v) do
		util.PrecacheSound(v2)
	end
end

for k, v in pairs(SCHEMA.rankModels) do
	nut.anim.setModelClass(v, "metrocop")
	player_manager.AddValidModel("combine", v)
	util.PrecacheModel(v)
end