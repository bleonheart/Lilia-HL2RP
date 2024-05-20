--------------------------------------------------------------------------------------------------------
ITEM.name = "Moonshine"
ITEM.desc = "High-proof illegal liquor."
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.healthRestore = 30
ITEM.category = "consumables"
ITEM.restore = 33
ITEM.price = 100
ITEM.permit = "food"
--------------------------------------------------------------------------------------------------------
ITEM.functions.Drink = {
    icon = "icon16/cup.png",
    sound = "items/battery_pickup.wav",
    onRun = function(item)
        item.player:SetHealth(math.min(item.player:Health() + item.restore, 100))
        item.player:setLocalVar("stm", math.min(item.player:getLocalVar("stm", 100) + item.restore, 100))
    end
}
--------------------------------------------------------------------------------------------------------
