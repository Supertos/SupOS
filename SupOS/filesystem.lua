
--[[
	filesystem.lua
	-----------------------------------
	Manages loading files and stuff
--]]

cmp = require "component"
pc = require "computer"
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