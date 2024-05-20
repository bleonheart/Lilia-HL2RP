ITEM.name = "Burger"
ITEM.desc = "A food consisting of fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun."
ITEM.model = "models/food/burger.mdl"
ITEM.healthRestore = 30
ITEM.restore = 75
ITEM.category = "consumables"
ITEM.price = 90
ITEM.functions.Use = {
    sound = "items/battery_pickup.wav",
    onRun = function(item)
        item.player:SetHealth(math.min(item.player:Health() + item.restore, 100))
        item.player:setLocalVar("stm", math.min(item.player:getLocalVar("stm", 100) + item.restore, 100))
    end
}

ITEM.permit = "food"
