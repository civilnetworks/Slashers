-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:48
-- @Last Modified by:   Garrus2142
-- @Last Modified time: 2017-07-27 17:09:45

DEFINE_BASECLASS( "gamemode_base" )
include("shared.lua")
include("config.lua")
include("libs/zones.lua")
include("core/_includes.lua")
include("modulesloader.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("core/_includes.lua")
AddCSLuaFile("modulesloader.lua")

GAME_LUM = "g"

function GM:CanPlayerSuicide()
	return false
end

function GM:Initialize()
	timer.Simple(0,function()engine.LightStyle(0,GAME_LUM)end)
end


-- Prevent self respawn
function GM:PlayerDeathThink()
	return false
end

function GM:PlayerNoClip( ply )
	return false
end

-- Fall damage
function GM:GetFallDamage( ply, speed )
	return ( speed / 8 )
end

--[[---------------------------------------------------------
	Name: gamemode:IsSpawnpointSuitable( player )
	Desc: Find out if the spawnpoint is suitable or not
-----------------------------------------------------------]]
local spawnpointmin = Vector( -16, -16, 0 )
local spawnpointmax = Vector( 16, 16, 64 )
function GM:IsSpawnpointSuitable( pl, spawnpointent, bMakeSuitable )

	local Pos = spawnpointent:GetPos()

	-- Note that we're searching the default hull size here for a player in the way of our spawning.
	-- This seems pretty rough, seeing as our player's hull could be different.. but it should do the job
	-- (HL2DM kills everything within a 128 unit radius)
	if ( pl:Team() == TEAM_SPECTATOR ) then return true end

	local Blockers = 0
	for k, v in ipairs( ents.FindInBox( Pos + spawnpointmin, Pos + spawnpointmax ) ) do
		if ( IsValid( v ) && v != pl && v:GetClass() == "player" && v:Alive() ) then

			Blockers = Blockers + 1
			if (bMakeSuitable) then
				print("Prevented spawn-kill for " .. v:Nick())
			end

		end
	end

	if ( bMakeSuitable ) then return true end
	if ( Blockers > 0 ) then return false end
	return true

end