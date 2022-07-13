
--[[
	tasks.lua
	-----------------------------------
	Manages multitasking
--]]

local SUPOS_TASKS = {}



function NewTask( Path )
	
	local task = load( loadFile( Path ) )
	
	SUPOS_TASKS[#SUPOS_TASKS + 1] = coroutine.create( task )
	
	assert( coroutine.resume( SUPOS_TASKS[#SUPOS_TASKS] ), "Fuck you too!")
end

function DoTasks( )
	
	for i = 1, #SUPOS_TASKS, 1 do
		if coroutine.status( SUPOS_TASKS[i] ) == "dead" then
			table.remove( SUPOS_TASKS, i )
			error("Dead thread!")
		end
	end
	
	for id, task in ipairs( SUPOS_TASKS ) do
		assert( coroutine.resume( task ), "Dead man found!")
	end
end


