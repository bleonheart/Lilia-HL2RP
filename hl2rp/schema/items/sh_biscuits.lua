ITEM.name = "Biscuits Box"
ITEM.desc = "Packaged buscuits waiting for consumption."
ITEM.model = "models/hlvr/food/biscuits_box_1.mdl"
ITEM.healthRestore = 25
ITEM.restore = 75
ITEM.category = "consumables"
ITEM.price = 60
ITEM.functions.Use = {
	sound = "items/battery_pickup.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + item.restore, 100))
		item.player:setLocalVar("stm", math.min(item.player:getLocalVar("stm", 100) + item.restore, 100))
	end
}
ITEM.permit = "food"