function SCHEMA:saveObjectives()
    lia.data.set("objectives", self.objectives, false, true)
end

function SCHEMA:saveVendingMachines()
    local data = {}
    for k, v in ipairs(ents.FindByClass("lia_vendingm")) do
        data[#data + 1] = {v:GetPos(), v:GetAngles(), v:getNetVar("stocks"), v:getNetVar("active")}
    end

    lia.data.set("vendingm", data)
end

function SCHEMA:saveDispensers()
    local data = {}
    for k, v in ipairs(ents.FindByClass("lia_dispenser")) do
        data[#data + 1] = {v:GetPos(), v:GetAngles(), v:GetDisabled() == true and true or nil}
    end

    lia.data.set("dispensers", data)
end

function SCHEMA:loadObjectives()
    self.objectives = lia.data.get("objectives", "", false, true)
end

function SCHEMA:loadVendingMachines()
    local data = lia.data.get("vendingm") or {}
    for k, v in ipairs(data) do
        local entity = ents.Create("lia_vendingm")
        entity:SetPos(v[1])
        entity:SetAngles(v[2])
        entity:Spawn()
        entity:setNetVar("stocks", v[3] or {})
        entity:setNetVar("active", v[4])
    end
end

function SCHEMA:loadDispensers()
    for k, v in ipairs(lia.data.get("dispensers") or {}) do
        local entity = ents.Create("lia_dispenser")
        entity:SetPos(v[1])
        entity:SetAngles(v[2])
        entity:Spawn()
        if v[3] then entity:SetDisabled(true) end
    end
end
