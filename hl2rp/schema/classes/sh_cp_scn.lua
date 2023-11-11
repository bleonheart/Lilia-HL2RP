--------------------------------------------------------------------------------------------------------
CLASS.name = "Civil Protection Scanner"
--------------------------------------------------------------------------------------------------------
CLASS.desc = "A robotic, metal scanner for observing the city."
--------------------------------------------------------------------------------------------------------
CLASS.faction = FACTION_CP
--------------------------------------------------------------------------------------------------------
function CLASS:onCanBe(client)
    return client:isCombineRank(SCHEMA.scnRanks)
end

--------------------------------------------------------------------------------------------------------
function CLASS:onSet(client)
    local scanner = lia.module.list.scanner
    if scanner then
        scanner:createScanner(client, client:getCombineRank() == "CLAW.SCN")
    else
        client:ChatPrint("The server is missing the 'scanner' module.")
    end
end

--------------------------------------------------------------------------------------------------------
function CLASS:onLeave(client)
    if IsValid(client.liaScn) then
        local data = {}
        data.start = client.liaScn:GetPos()
        data.endpos = data.start - Vector(0, 0, 1024)
        data.filter = {client, client.liaScn}
        local position = util.TraceLine(data).HitPos
        client.liaScn.spawn = position
        client.liaScn:Remove()
    end
end

--------------------------------------------------------------------------------------------------------
CLASS_CP_SCN = CLASS.index
--------------------------------------------------------------------------------------------------------
