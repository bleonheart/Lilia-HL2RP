PLUGIN.name = "Combine Locks"
PLUGIN.author = "STEAM_0:1:176123778"
PLUGIN.desc = "Adds Combine locks to doors."

if (SERVER) then
	function PLUGIN:SaveData()
		local data = {}

		for k, v in ipairs(ents.FindByClass("lia_cmblock")) do
			if (IsValid(v.door)) then
				data[#data + 1] = {v.door:MapCreationID(), v.door:WorldToLocal(v:GetPos()), v.door:WorldToLocalAngles(v:GetAngles()), v:GetLocked() == true and true or nil}
			end
		end

		self:setData(data)
	end

	function PLUGIN:LoadData()
		local data = self:getData() or {}

		for k, v in ipairs(data) do
			local door = ents.GetMapCreatedEntity(v[1])

			if (IsValid(door) and door:isDoor()) then
				local entity = ents.Create("lia_cmblock")
				entity:SetPos(door:GetPos())
				entity:Spawn()
				entity:setDoor(door, door:LocalToWorld(v[2]), door:LocalToWorldAngles(v[3]))
				entity:SetLocked(v[4])

				if (v[4]) then
					entity:toggle(true)
				end
			end
		end
	end
end