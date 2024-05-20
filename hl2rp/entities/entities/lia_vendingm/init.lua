AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
function ENT:SpawnFunction(client, trace)
    local entity = ents.Create("lia_vendingm")
    entity:SetPos(trace.HitPos + Vector(0, 0, 48))
    local angles = (entity:GetPos() - client:GetPos()):Angle()
    angles.p = 0
    angles.y = math.Round(angles.y / 45) * 45 + 180
    angles.r = 0
    entity:SetAngles(angles)
    entity:Spawn()
    entity:Activate()
    for k, v in pairs(ents.FindInBox(entity:LocalToWorld(entity:OBBMins()), entity:LocalToWorld(entity:OBBMaxs()))) do
        if v:GetClass() ~= "lia_vendingm" and v:GetModel() == "models/props_interiors/vendingmachinesoda01a.mdl" then
            entity:SetPos(v:GetPos())
            entity:SetAngles(v:GetAngles())
            SafeRemoveEntity(v)
            break
        end
    end

    SCHEMA:saveVendingMachines()
    return entity
end

function ENT:Initialize()
    self.buttons = {}
    local position = self:GetPos()
    local f, r, u = self:GetForward(), self:GetRight(), self:GetUp()
    self.buttons[1] = position + f * 18 + r * -24.4 + u * 5.3
    self.buttons[2] = position + f * 18 + r * -24.4 + u * 3.35
    self.buttons[3] = position + f * 18 + r * -24.4 + u * 1.35
    self:SetModel("models/props_interiors/vendingmachinesoda01a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:setNetVar("stocks", {10, 5, 5})
    self:setNetVar("active", true)
    local physObj = self:GetPhysicsObject()
    if IsValid(physObj) then
        physObj:EnableMotion(false)
        physObj:Sleep()
    end

    for k, v in pairs(ents.FindInBox(self:LocalToWorld(self:OBBMins()), self:LocalToWorld(self:OBBMaxs()))) do
        if v:GetClass() ~= "lia_vendingm" and v:GetModel() == "models/props_interiors/vendingmachinesoda01a.mdl" then
            self:SetPos(v:GetPos())
            self:SetAngles(v:GetAngles())
            SafeRemoveEntity(v)
            return
        end
    end
end

function ENT:Use(activator)
    activator:EmitSound("buttons/lightswitch2.wav", 55, 125)
    if (self.nextUse or 0) < CurTime() then
        self.nextUse = CurTime() + 2
    else
        return
    end

    local button = self:getNearestButton(activator)
    local stocks = self:getNetVar("stocks")
    if activator:isCombine() then
        if activator:KeyDown(IN_SPEED) and button and stocks[button] then
            if stocks[button] > 0 then return activator:addDisplay("NO REFILL IS REQUIRED FOR THIS MACHINE.") end
            self:EmitSound("buttons/button5.wav")
            if not activator:getChar():hasMoney(25) then
                return activator:addDisplay("INSUFFICIENT FUNDS (25 TOKENS) TO REFILL MACHINE.")
            else
                activator:addDisplay("25 TOKENS HAVE BEEN TAKEN TO REFILL MACHINE.")
                activator:getChar():takeMoney(25)
            end

            timer.Simple(1, function()
                if not IsValid(self) then return end
                stocks[button] = button == 1 and 10 or 5
                self:setNetVar("stocks", stocks)
            end)
            return
        else
            self:setNetVar("active", not self:getNetVar("active"))
            self:EmitSound(self:getNetVar("active") and "buttons/combine_button1.wav" or "buttons/combine_button2.wav")
            return
        end
    end

    if self:getNetVar("active") == false then return end
    if button and stocks and stocks[button] and stocks[button] > 0 then
        local item = "water"
        local price = 5
        if button == 2 then
            item = "water_sparkling"
            price = price + 10
        elseif button == 3 then
            item = "water_special"
            price = price + 15
        end

        if not activator:getChar():hasMoney(price) then
            self:EmitSound("buttons/button2.wav")
            return activator:notify("You need " .. lia.currency.get(price) .. " to purchase this selection.")
        end

        local position = self:GetPos()
        local f, r, u = self:GetForward(), self:GetRight(), self:GetUp()
        lia.item.spawn(item, position + f * 19 + r * 4 + u * -26, function(item, entity)
            stocks[button] = stocks[button] - 1
            if stocks[button] < 1 then self:EmitSound("buttons/button6.wav") end
            self:setNetVar("stocks", stocks)
            self:EmitSound("buttons/button4.wav", Angle(0, 0, 90))
            activator:getChar():takeMoney(price)
            activator:getChar():takeMoney(price)
            activator:notify("You have spent " .. lia.currency.get(price) .. " on this vending machine.")
        end)
    end
end

function ENT:OnRemove()
    if not lia.shuttingDown then SCHEMA:saveVendingMachines() end
end
