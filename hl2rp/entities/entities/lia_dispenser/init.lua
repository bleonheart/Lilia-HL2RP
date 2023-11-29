---------------------------------------------------------------------------------------------------------------------------------------------
AddCSLuaFile("cl_init.lua")
--------------------------------------------------------------------------------------------------------------------------
AddCSLuaFile("shared.lua")
--------------------------------------------------------------------------------------------------------------------------
include("shared.lua")
--------------------------------------------------------------------------------------------------------
function ENT:SpawnFunction(client, trace)
    local entity = ents.Create("lia_dispenser")
    entity:SetPos(trace.HitPos)
    entity:SetAngles(trace.HitNormal:Angle())
    entity:Spawn()
    entity:Activate()
    SCHEMA:saveDispensers()

    return entity
end

--------------------------------------------------------------------------------------------------------
function ENT:Initialize()
    self:SetModel("models/props_junk/gascan001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:SetText("INSERT ID")
    self:DrawShadow(false)
    self.canUse = true
    self.dummy = ents.Create("prop_dynamic")
    self.dummy:SetModel("models/props_combine/combine_dispenser.mdl")
    self.dummy:SetPos(self:GetPos())
    self.dummy:SetAngles(self:GetAngles())
    self.dummy:SetParent(self)
    self.dummy:Spawn()
    self.dummy:Activate()
    self:DeleteOnRemove(self.dummy)
    local physObj = self:GetPhysicsObject()
    if IsValid(physObj) then
        physObj:EnableMotion(false)
        physObj:Sleep()
    end
end

--------------------------------------------------------------------------------------------------------
function ENT:setUseAllowed(state)
    self.canUse = state
end

--------------------------------------------------------------------------------------------------------
function ENT:error(text)
    self:EmitSound("buttons/combine_button_locked.wav")
    self:SetText(text)
    timer.Create(
        "lia_DispenserError" .. self:EntIndex(),
        1.5,
        1,
        function()
            if IsValid(self) then
                self:SetText("INSERT ID")
                timer.Simple(
                    0.5,
                    function()
                        if not IsValid(self) then return end
                        self:setUseAllowed(true)
                    end
                )
            end
        end
    )
end

--------------------------------------------------------------------------------------------------------
function ENT:createRation()
    local entity = ents.Create("prop_physics")
    entity:SetAngles(self:GetAngles())
    entity:SetModel("models/weapons/w_package.mdl")
    entity:SetPos(self:GetPos())
    entity:Spawn()
    entity:SetNotSolid(true)
    entity:SetParent(self.dummy)
    entity:Fire("SetParentAttachment", "package_attachment")
    timer.Simple(
        1.2,
        function()
            if IsValid(self) and IsValid(entity) then
                entity:Remove()
                lia.item.spawn("ration", entity:GetPos(), nil, entity:GetAngles())
            end
        end
    )
end

--------------------------------------------------------------------------------------------------------
function ENT:dispense(amount)
    if amount < 1 then return end
    self:setUseAllowed(false)
    self:SetText("DISPENSING")
    self:EmitSound("ambient/machines/combine_terminal_idle4.wav")
    self:createRation()
    self.dummy:Fire("SetAnimation", "dispense_package", 0)
    timer.Simple(
        3.5,
        function()
            if IsValid(self) then
                if amount > 1 then
                    self:dispense(amount - 1)
                else
                    self:SetText("ARMING")
                    self:EmitSound("buttons/combine_button7.wav")
                    timer.Simple(
                        7,
                        function()
                            if not IsValid(self) then return end
                            self:SetText("INSERT ID")
                            self:EmitSound("buttons/combine_button1.wav")
                            timer.Simple(
                                0.75,
                                function()
                                    if not IsValid(self) then return end
                                    self:setUseAllowed(true)
                                end
                            )
                        end
                    )
                end
            end
        end
    )
end

--------------------------------------------------------------------------------------------------------
function ENT:Use(activator)
    if (self.nextUse or 0) >= CurTime() then return end
    if activator:Team() == FACTION_CITIZEN then
        if not self.canUse or self:GetDisabled() then return end
        self:setUseAllowed(false)
        self:SetText("CHECKING")
        self:EmitSound("ambient/machines/combine_terminal_idle2.wav")
        timer.Simple(
            1,
            function()
                if not IsValid(self) or not IsValid(activator) then return self:setUseAllowed(true) end
                local found = false
                local amount = 0
                local item
                for k, v in pairs(activator:getChar():getInv():getItems()) do
                    if v.uniqueID == "cid" then
                        found = true
                        if v:getData("nextTime", 0) < os.time() then
                            if v:getData("cwu") then
                                amount = 2
                            else
                                amount = 1
                            end

                            item = v
                            break
                        end
                    end
                end

                local inventory = activator:getChar():getInv()
                local item
                if inventory then
                    if inventory.getFirstItemOfType then
                        item = inventory:getFirstItemOfType("cid")
                    else
                        item = inventory:hasItem("cid")
                    end
                end

                if not found then
                    return self:error("INVALID ID")
                elseif found and amount == 0 then
                    return self:error("TRY LATER")
                else
                    item:setData("nextTime", os.time() + 300)
                    self:SetText("ID OKAY")
                    self:EmitSound("buttons/button14.wav", 100, 50)
                    timer.Simple(
                        1,
                        function()
                            if IsValid(self) then
                                self:dispense(amount)
                            end
                        end
                    )
                end
            end
        )
    elseif activator:isCombine() then
        self:SetDisabled(not self:GetDisabled())
        self:EmitSound(self:GetDisabled() and "buttons/combine_button1.wav" or "buttons/combine_button2.wav")
        self.nextUse = CurTime() + 1
    end
end

--------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
    if not lia.shuttingDown then
        SCHEMA:saveDispensers()
    end
end
--------------------------------------------------------------------------------------------------------