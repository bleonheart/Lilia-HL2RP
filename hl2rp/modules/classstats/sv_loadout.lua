--------------------------------------------------------------------------------------------------------
function MODULE:doLoadout(client)
    local char = client:getChar()

    if char then
        local charClass = char:getClass()
        local class = lia.class.list[charClass]
        if not class then return end
        if class.None then return end

        if class.armor then
            client:SetArmor(class.armor)
        else
            client:SetArmor(0)
        end

        if class.scale then
            local scaleViewFix = class.scale
            local scaleViewFixOffset = Vector(0, 0, 64)
            local scaleViewFixOffsetDuck = Vector(0, 0, 28)
            client:SetViewOffset(scaleViewFixOffset * class.scale)
            client:SetViewOffsetDucked(scaleViewFixOffsetDuck * class.scale)
            client:SetModelScale(scaleViewFix)
        else
            client:SetViewOffset(Vector(0, 0, 64))
            client:SetViewOffsetDucked(Vector(0, 0, 28))
            client:SetModelScale(1)
        end

        if class.runSpeed then
            if class.runSpeedMultiplier then
                client:SetRunSpeed(math.Round(lia.config.get("runSpeed") * class.runSpeed))
            else
                client:SetRunSpeed(class.runSpeed)
            end
        end

        if class.walkSpeed then
            if class.walkSpeedMultiplier then
                client:SetWalkSpeed(math.Round(lia.config.get("walkSpeed") * class.walkSpeed))
            else
                client:SetWalkSpeed(class.walkSpeed)
            end
        end

        if class.jumpPower then
            if class.jumpPowerMultiplier then
                client:SetJumpPower(math.Round(160 * class.jumpPower))
            else
                client:SetJumpPower(class.jumpPower)
            end
        else
            client:SetJumpPower(160)
        end

        --Blood enums here https://wiki.garrysmod.com/page/Enums/BLOOD_COLOR
        if class.bloodcolor then
            client:SetBloodColor(class.bloodcolor)
        else
            client:SetBloodColor(BLOOD_COLOR_RED) --This is the index for regular red blood
        end

        if class.health then
            client:SetMaxHealth(class.health)
            client:SetHealth(class.health)
        end
    end
end
--------------------------------------------------------------------------------------------------------