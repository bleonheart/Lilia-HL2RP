SCHEMA.objectives = SCHEMA.objectives or ""
concommand.Add("lia_setupnexusdoors", function(client, _, arguments)
    if not IsValid(client) then
        if not lia.module.list.doors then return MsgN("[Lilia] Door module is missing!") end
        local name = table.concat(arguments, " ")
        for _, entity in ipairs(ents.FindByClass("func_door")) do
            if not entity:HasSpawnFlags(256) and not entity:HasSpawnFlags(1024) then
                entity:setNetVar("noSell", true)
                entity:setNetVar("name", not name:find("%S") and "Nexus" or name)
            end
        end

        lia.module.list.doors:SaveDoorData()
        MsgN("[Lilia] Nexus doors have been set up.")
    end
end)
