SCHEMA.objectives = SCHEMA.objectives or ""
concommand.Add(
    "nut_setupnexusdoors",
    function(client, command, arguments)
        if not IsValid(client) then
            if not nut.plugin.list.doors then return MsgN("[NutScript] Door plugin is missing!") end
            local name = table.concat(arguments, " ")
            for _, entity in ipairs(ents.FindByClass("func_door")) do
                if not entity:HasSpawnFlags(256) and not entity:HasSpawnFlags(1024) then
                    entity:setNetVar("noSell", true)
                    entity:setNetVar("name", not name:find("%S") and "Nexus" or name)
                end
            end

            nut.plugin.list.doors:SaveDoorData()
            MsgN("[NutScript] Nexus doors have been set up.")
        end
    end
)
