----------------------------------------------------------------------------------------------
hook.Run("AddPIMOption", PIM.options)
----------------------------------------------------------------------------------------------
function PIM:CheckDistance(ply, ent)
    return ent:GetPos():Distance(ply:GetPos()) < lia.config.MaxInteractionDistance
end

----------------------------------------------------------------------------------------------
function PIM:AddOption(name, data)
    self.options[name] = data
end
----------------------------------------------------------------------------------------------
