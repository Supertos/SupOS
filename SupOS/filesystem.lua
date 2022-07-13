
--[[
	filesystem.lua
	-----------------------------------
	Manages loading files and stuff
--]]

local cmp = require "component"
local pc = require "computer"

local bootdrive = pc.getBootAddress()

local Drives = {}


function getDrives()
	local list = cmp.list()
	local drives = {}
	
	for adr, type in pairs( list ) do
		if type == "drive" then
			drives[ #drives + 1 ] = adr
		end
	end
	return list
	
end

function isBootDrive( adr )
	return adr == bootdrive
end

function registerDrive( adr, letter )
	Drives[ letter ] = adr
end

function translatePath( path )
	return Drives[ string.sub( path, 1, 1 ) ], string.sub( path, 3, string.len( path ) )
end