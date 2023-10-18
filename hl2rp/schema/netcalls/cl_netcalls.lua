--------------------------------------------------------------------------------------------------------
netstream.Hook(
	"cDisp",
	function(text, color)
		SCHEMA:addDisplay(text, color)
	end
)

--------------------------------------------------------------------------------------------------------
netstream.Hook(
	"plyData",
	function(...)
		vgui.Create("nutData"):setData(...)
	end
)

--------------------------------------------------------------------------------------------------------
netstream.Hook(
	"obj",
	function(...)
		vgui.Create("nutObjective"):setData(...)
	end
)

--------------------------------------------------------------------------------------------------------
netstream.Hook(
	"voicePlay",
	function(sounds, volume, index)
		if index then
			local client = Entity(index)
			if IsValid(client) then
				nut.util.emitQueuedSounds(client, sounds, nil, nil, volume)
			end
		else
			nut.util.emitQueuedSounds(LocalPlayer(), sounds, nil, nil, volume)
		end
	end
)