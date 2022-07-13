--[[
	startup.lua
	-----------------------------------
	This file initializes SupOS
--]]


local addr, invoke = computer.getBootAddress(), component.invoke

local function include(file)
	local handle = assert(invoke(addr, "open", file))
	local buffer = ""
	local data = ""
	repeat
      data = invoke(addr, "read", handle, math.huge)
      buffer = buffer .. (data or "")
    until not data
	
	invoke(addr, "close", handle)
	load(buffer, "=" .. file, "bt", _G)()
end

include("/SupOS/filesystem.lua")

--error( loadFile )

include("/SupOS/tasks.lua")

NewTask( "C:/Program Files/SupOS Window Controller/init.lua" )

while true do
	DoTasks()
	coroutine.yield()
end