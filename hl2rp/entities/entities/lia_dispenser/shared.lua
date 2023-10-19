--------------------------------------------------------------------------------------------------------
ENT.Type = "anim"
ENT.PrintName = "Ration Dispenser"
ENT.Author = "STEAM_0:1:176123778"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.PhysgunAllowAdmin = true
--------------------------------------------------------------------------------------------------------
function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "DispColor")
	self:NetworkVar("String", 1, "Text")
	self:NetworkVar("Bool", 0, "Disabled")
end
--------------------------------------------------------------------------------------------------------