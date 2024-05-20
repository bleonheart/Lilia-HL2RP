
netstream.Hook("dataCls", function(client, text)
    local target = client.liaDataTarget
    if text and IsValid(target) and target:getChar() and hook.Run("CanPlayerEditData", client, target) then
        target:getChar():setData("txt", text:sub(1, 750))
        client:EmitSound("buttons/combine_button7.wav", 60, 150)
    end

    client.liaDataTarget = nil
end)


netstream.Hook("obj", function(client, text)
    if hook.Run("CanPlayerEditObjectives", client) then
        SCHEMA.objectives = text
        SCHEMA:addDisplay(client:Name() .. " has updated the objectives", Color(0, 0, 255))
        SCHEMA:saveObjectives()
    end
end)

