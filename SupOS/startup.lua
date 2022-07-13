--[[
	startup.lua
	-----------------------------------
	This file initializes SupOS
--]]


local addr, invoke = computer.getBootAddress(), component.invoke

local function loadfile(file)
	local handle = assert(invoke(addr, "open", file))
	local buffer = ""
	local data = ""
	repeat
      data = invoke(addr, "read", handle, math.huge)
      buffer = buffer .. (data or "")
    until not data
	
	invoke(addr, "close", handle)
	return load(buffer, "=" .. file, "bt", _G)
end

loadfile("/SupOS/filesystem.lua")()

loadfile("/SupOS/tasks.lua")()