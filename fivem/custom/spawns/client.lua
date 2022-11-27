-- Lua in FiveM (through CfxLua) supports first-class vectors, which in this case can be accessed using .x, .y and .z.

-- Hospital principal
local spawnPos = vector3(-463.601, -289.901, 35.83322)

--exports.spawnmanager:setAutoSpawn(false)
RegisterCommand('respawn', function(args)
	TriggerEvent('chat:addMessage', {
            args = { 'Respawn em: ' ..spawnPos.. '.' }
        })
	
	exports.spawnmanager:setAutoSpawnCallback(function()
        	exports.spawnmanager:spawnPlayer({
            		x = spawnPos.x,
            		y = spawnPos.y,
            		z = spawnPos.z,
            		model = 'u_m_y_corpse_01'
		}, function()
		end)
	end)
    	exports.spawnmanager:forceRespawn()
end, false)


RegisterCommand('relive', function(args)
	 -- get the player's position
    	local player = PlayerPedId() -- get the local player ped
    	local pos = GetEntityCoords(player) -- get the position of the local player ped
	local spawnPos = pos

	TriggerEvent('chat:addMessage', {
            args = { 'Respawn em: ' ..spawnPos.. '.' }
        })
	
	exports.spawnmanager:setAutoSpawnCallback(function()
        	exports.spawnmanager:spawnPlayer({
            		x = spawnPos.x,
            		y = spawnPos.y,
            		z = spawnPos.z,
            		model = 'u_m_y_corpse_01'
		}, function()
		end)
	end)
    	exports.spawnmanager:forceRespawn()
end, false)

RegisterCommand('pier', function(args)
	 -- get the player's position
    	local player = PlayerPedId() -- get the local player ped
    	local pos = GetEntityCoords(player) -- get the position of the local player ped
	local spawnPos = pos

	TriggerEvent('chat:addMessage', {
            args = { 'Respawn em: ' ..spawnPos.. '.' }
        })
	
	exports.spawnmanager:setAutoSpawnCallback(function()
        	exports.spawnmanager:spawnPlayer({
            		x = -1682.105,
            		y = -920.6335,
            		z = 7.851274,
            		model = 'u_m_y_corpse_01'
		}, function()
		end)
	end)
    	exports.spawnmanager:forceRespawn()
end, false)

--local spawnPos = vector3(686.245, 577.950, 130.461)
--local spawnPos = vector3(-275.522, 6635.835, 7.425)
-- Hospital no centro
--local spawnPos = vector3(359.5091, -587.6246, 28.81121)
	-- Tratamento instensivo
--	local spawnPos = vector3(340.8475, -588.4512, 43.29319)

-- Porto 
-- local spawnPos = vector3(120.4848, -3327.898, 5.609115)

-- Cento médico
--local spawnPos = vector3(340.3773, -1395.752, 32.50927)

-- Departamento de polícia
--local spawnPos = vector3(811.3596, -1289.793, 26.28867)

-- ST FIACRE HOSPITAL
--local spawnPos = vector3(1153.88, -1523.613, 34.84344)

--
-- add an event handler for the (local) event called 'onClientGameTypeStart'.
-- it takes no arguments in this case (in Lua you can omit arguments), since our resource is a game type and you can only run one at once,
-- that means this will basically run when we start ourselves on the client. nice!
AddEventHandler('onClientGameTypeStart', function()
    -- set an automatic spawn callback for the spawn manager.
    -- normally, this works using hardcoded spawn points, but since this is a scripting tutorial, we'll do it this way.
    --
    -- the spawn manager will call this when the player is dead, or when forceRespawn is called.
    exports.spawnmanager:setAutoSpawnCallback(function()
        -- spawnmanager has said we should spawn, let's spawn!
        exports.spawnmanager:spawnPlayer({
            -- this argument is basically a table containing the spawn location...
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            -- ... and the model to spawn as.
            --model = 'u_f_y_corpse_02'
            --model = 'u_f_m_corpse_01'
            --model = 'u_f_y_corpse_01'
            model = 'u_m_y_corpse_01'
	    --model = 'u_m_m_streetart_01'
            --model = 's_m_y_dwservice_02'
        }, function()
            -- a callback to be called once the player is spawned in and the game is visible
            -- in this case, we just send a message to the local chat box.
            TriggerEvent('chat:addMessage', {
                args = { 'Prove que é bem vindo ao mundo de wagtono' }
            })
        end)
    end)

    -- enable auto-spawn
    --exports.spawnmanager:setAutoSpawn(true)

    -- and force respawn when the game type starts
    exports.spawnmanager:forceRespawn()
end)
