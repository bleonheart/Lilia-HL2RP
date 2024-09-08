netstream.Hook("cDisp", function(text, color) SCHEMA:addDisplay(text, color) end)
netstream.Hook("plyData", function(...) vgui.Create("liaData"):setData(...) end)
netstream.Hook("obj", function(...) vgui.Create("liaObjective"):setData(...) end)
netstream.Hook("voicePlay", function(sounds, volume, index)
    if index then
        local client = Entity(index)
        if IsValid(client) then EmitQueuedSounds(client, sounds, nil, nil, volume) end
    else
        EmitQueuedSounds(LocalPlayer(), sounds, nil, nil, volume)
    end
end)
