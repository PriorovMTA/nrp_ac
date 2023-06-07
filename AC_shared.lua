-- AC_shared.lua

-- Запрещенное оружие
BLOCKED_WEAPONS = {
    [26] = true,
    [27] = true, 
    [31] = true,
    [35] = true,
    [38] = true
}

-- Разрешенные клиентские элементы данных
ALLOWED_CLIENT_ELEMENT_DATA = {
	["fFuel"]           = true,
	["fMileage"]        = true,
	["signals"]         = true,
	["parachuting"]     = true,
	["skydiving"]       = true,
	["animation_state"] = true
}
