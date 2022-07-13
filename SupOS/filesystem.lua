
--[[
	filesystem.lua
	-----------------------------------
	Manages loading files and stuff
--]]

pc = computer
cmp = component

local bootdrive = pc.getBootAddress()

local Drives = {}

Drives[ "c" ] = bootdrive

function getDrives()
	local list = cmp.list()
	local drives = {}
	
	for adr, type in pairs( list ) do
		if type == "filesystem" then
			drives[ #drives + 1 ] = adr
		end
	end
	return list
	
end

function isBootDrive( adr )
	return adr == bootdrive
end

function registerDrive( adr, letter )
	Drives[ string.lower(letter) ] = adr
end

function translatePath( path )
	return Drives[ string.sub( string.lower(path), 1, 1 ) ], string.sub( path, 3, string.len( path ) )
end

function loadFile( path )

	local drive, path = translatePath( path )
	local handle = cmp.invoke(drive, "open", path)
	
	if not handle then return "" end
	
	
	local buffer = ""
	local data = ""
	repeat
		data = cmp.invoke(drive, "read", handle, math.huge)
		buffer = buffer .. (data or "")
    until not data
	
	invoke(drive, "close", handle)
	return data


end