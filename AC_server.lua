loadstring ( exports.interfacer:extend ( 'Interfacer' ) ) ( )
Extend ( 'SPlayer' )

function Detection ( action, acName )
	local acName = acName or '[AC#4]'
	acName = acName
	local player = client or source

	if action == 1 then
		local text = ( 'Игрок %s [ id: %s ] кикнут античитом по причине: %s' ):format ( player:GetNickName ( ), player:GetID ( ), acName )
		AdminMessage ( text, 255, 0, 0 )
		player:kick ( acName )
	elseif action == 2 then
		local text = ( 'Игрок %s [ id: %s ] забанен античитом НАВСЕГДА по причине: %s'):format ( player:GetNickName ( ), player:GetID ( ), acName )
		AdminMessage ( text, 255, 0, 0 )

		for i, v in ipairs ( getElementsByType ( 'player' ) ) do
			if v:IsAdmin ( ) then
				v:ShowInfo ( text..' 1' )
				v:ShowInfo ( text..' 2' )
				v:ShowInfo ( text..' 3' )
			end
		end

		player:ban ( false, false, true, 'Console', acName )
	end
end
addEvent ( 'AC:Detection', true )
addEventHandler ( 'AC:Detection', resourceRoot, Detection )

function onElementDataChange_handler( key, old )
	if client and not ALLOWED_CLIENT_ELEMENT_DATA[ key ] then
		local new = getElementData( source, key )
		--WriteLog( "edata", "Запрещённое изменение данных: клиент %s для элемента %s ключ %s данные %s старые %s", client, source, key, tostring( new ), tostring( old ) )
		setElementData( source, key, old )

		local text = ( ' [ ANTICHEAT ] :: change elementData to [ player: %s id: %s ], [ key: %s, value: %s ], client: %s, clientID: %s' ):format ( source:GetNickName ( ), source:GetID ( ), key, tostring ( value ),
		client.type == 'player' and client:GetNickName ( ) or 'client', client:GetID ( ) )
		AdminMessage ( text )
		for i, v in ipairs ( getElementsByType ( 'player' ) ) do
			if v:IsAdmin ( ) then
				v:ShowInfo ( text..' 1' )
				v:ShowInfo ( text..' 2' )
				v:ShowInfo ( text..' 3' )
			end
		end

		if client and client.type == 'player' then
			client:ban ( false, false, true, 'Console', '[ elementData Change ]' )
		end
	end
end
addEventHandler( "onElementDataChange", root, onElementDataChange_handler )

function LUAIject_Hand ( res, func, _, file, arg1, arg2, arg3 )
	if res.name == 'runcode' then return end
	if func == 'pcall' or func == 'loadstring' then
		if localPlayer then
			outputChatBox(localPlayer.name)
		end
		iprint("Античит", res,func,_,file, arg1, arg2, arg3, localPlayer, source)
		if tostring ( file ) == '[string "?"]' or tostring ( file ) == '' then

			triggerServerEvent ( resourceRoot, 2, '[LUA Iject]' )
		end
	end
end
addDebugHook ( 'preFunction', LUAIject_Hand, { pcall, loadstring } )

--[[isHookSuccess = function() 
	local ip = 'nextrp.ru' 
	local port = '22003' 
	if getServerConfigSetting('serverip') == ip and getServerConfigSetting('serverport') == port then 
	else 
		local resourcename = getThisResource()
		outputChatBox ( "Ресурс " .. getResourceName(resourcename) .. " имеет привязку" )
		iprint("1")
	 cancelEvent() 
	end 
   end 
   addEventHandler('onResourceStart', root, isHookSuccess)]]
