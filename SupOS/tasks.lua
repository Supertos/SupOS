
--[[
	tasks.lua
	-----------------------------------
	Manages multitasking
--]]

local SUPOS_TASKS = {}



function NewTask( Path )
	local task = load( loadfile( Path ) )
	
	SUPOS_TASKS[#SUPOS_TASKS + 1] = coroutine.create( task ) 

	
end






