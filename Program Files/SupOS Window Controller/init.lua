

local ViewPorts = {}

local Elements = {}
function getGPUs()

	local list = cmp.list()
	local drives = {}
	
	for adr, type in pairs( list ) do
		if type == "gpu" then
			drives[ #drives + 1 ] = adr
		end
	end
	return list


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

function AddElement()

end

function Initialize()
	local Screens, GPUs = getScreens(), getGPUs()
	
	error( #Screens.." "..#GPUs )
	for i = 1, math.min( #Screens, #GPUs ), 1 do
		component.invoke( GPUs[ i ], "bind", Screens[ i ], true )
		Elements[ i ] = {} --Create layouts for each screen
		ViewPorts[ #ViewPorts + 1 ] = GPUs[ i ]
	end
	

end

function Run()
	component.invoke(ViewPorts[1], "set", 10, 10, "Sosi hui pidaras!" )
end

Initialize()
while true do 
	Run()
	coroutine.yield()
end