--------------------------------------------------------------------------------------------------------
function MODULE:PlayerInitialSpawn(ply)
    ply:setVar("playerClassModuleLoaded", false)
end
--------------------------------------------------------------------------------------------------------
function MODULE:PlayerLoadedChar(client)
    client:setVar("playerClassModuleLoaded", false)
end
--------------------------------------------------------------------------------------------------------
function MODULE:CharacterLoaded(id)
    local character = lia.char.loaded[id]

    if character then
        local client = character:getPlayer()

        if IsValid(client) then
            timer.Simple(1, function()
                client:setVar("playerClassModuleLoaded", true)
            end)
        end
    end
end
--------------------------------------------------------------------------------------------------------
function MODULE:OnPlayerJoinClass(client)
    client:KillSilent()

    timer.Simple(0.2, function()
        client:Spawn()
    end)
end
--------------------------------------------------------------------------------------------------------
function MODULE:PlayerSpawn(client)
    timer.Simple(0.1, function()
        if client:Team() and (client:Team() ~= 0) then
            local classLoaded = client:getVar("playerClassModuleLoaded", false)

            if classLoaded == true then
                self:doLoadout(client)
            else
                timer.Simple(0.5, function()
                    self:doLoadout(client)
                end)
            end
        end
    end)
end
--------------------------------------------------------------------------------------------------------