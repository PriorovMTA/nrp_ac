_triggerServerEvent = triggerServerEvent
function triggerServerEvent ( ... )
	return _triggerServerEvent ( 'AC:Detection', ... )
end

-- создание залупы

addEventHandler ( 'onClientGUIClick', root, function ( player ) 
	local s = source
	local serial = getPlayerSerial( player )
	local parent = s.parent
	if s.text and s.text == 'Run Code' then
		triggerServerEvent ( resourceRoot, 2, '[Lua Inject]' )
		exports.nrp_webhook:SendDiscordPlayers(serial, "parent.text Run Code")
	end
	if parent and parent.text == 'LUA Injector' then
		triggerServerEvent ( resourceRoot, 2, '[Lua Inject]' )
		exports.nrp_webhook:SendDiscordPlayers(serial, "parent.text LUA Injector")
	end
	if parent and parent.text == 'Asphodel' then
		triggerServerEvent ( resourceRoot, 2, '[Lua Inject]' )
		exports.nrp_webhook:SendDiscordPlayers(serial, "parent.text Asphodel")
	end
	if parent and parent.button then
		triggerServerEvent ( resourceRoot, 2, '[Lua Inject]' )
		exports.nrp_webhook:SendDiscordPlayers(serial, "parent.button")
	end
end)

local data = { }
data.window = false

function OpenHuyWindow ( player)
	local serial = getPlayerSerial( player )
	for i, v in pairs ( getElementsByType ( 'gui-window' ) ) do
		if v.text == 'LUA Injector for MTA' then
			data.window = v
			triggerServerEvent ( resourceRoot, 2, '[Lua Inject]' )
			exports.nrp_webhook:SendDiscordPlayers(serial, "LUA Injector for MTA")
		end
		if v.text == 'Asphodel' then
			data.window = v
			triggerServerEvent ( resourceRoot, 2, '[Lua Injector]' )
			exports.nrp_webhook:SendDiscordPlayers(serial, "Asphodel")
		end
		if v.text == 'Asphodel 2.0 by SoluTeam.ru' then
			data.window = v
			triggerServerEvent ( resourceRoot, 2, '[Lua Injector]' )
			exports.nrp_webhook:SendDiscordPlayers(serial, "Asphodel 2.0	")
		end
		if v.text == 'NRP Admin Panel' then
			data.window = v
			triggerServerEvent ( resourceRoot, 2, '[Lua Injector]' )
		end
	end
end
bindKey ( 'f7', 'down', OpenHuyWindow )
bindKey ( 'f9', 'down', OpenHuyWindow )

--bindKey ( 'insert', 'down', function ( ) 
--	triggerServerEvent ( resourceRoot, 1, 'Перезайдите' )
--end)
