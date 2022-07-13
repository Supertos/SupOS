

local GPUs = {}


function getGPUs()

	local list = cmp.list()
	local drives = {}
	
	for adr, type in pairs( list ) do
		if type == "gpu" then
			drives[ #drives + 1 ] = adr
		end
	end
	return list
	
	--bind(address: string[, reset: boolean=true]): boolean[, string]


end

function getScreens()

	local list = cmp.list()
	local drives = {}
	
	for adr, type in pairs( list ) do
		if type == "screen" then
			drives[ #drives + 1 ] = adr
		end
	end
	return list
end

function Initialize()
	local Screens, GPUs = getScreens(), getGPUs()
	
	
	for i = 1, math.min( #Screens, #GPUs ), 1 do
		component.invoke( GPUs[ i ], "bind", Screens[ i ], true )
	end
	

end

