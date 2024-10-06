-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:45
-- @Last Modified by:   Garrus2142
-- @Last Modified time: 2017-08-07T18:52:51+02:00

local GM = GM or GAMEMODE
GM.CONFIG = {}

GM.CONFIG["disabled_modules"] = {
	-- ["goal"] = true, -- set true to disable module
}

-- Weapons for the Killer
GM.CONFIG["killer_weapons"] = {
	"tfa_nmrih_chainsaw",
	-- "tfa_nmrih_kknife",
	"tfa_nmrih_fireaxe",
	"tfa_nmrih_machete"
}
-- Weapons for survivors
GM.CONFIG["survivors_weapons"] = {
	"weapon_flashlight"
}
-- Adds addedkins added to each completed round
GM.CONFIG["round_choosekiller_add"] = 10
-- Round start time (seconds)
GM.CONFIG["round_freeze_start"] = 10
-- Waiting time at the end of a round
GM.CONFIG["round_duration_end"] = 20

-- Entités Killerhelp porte
GM.CONFIG["killerhelp_door_entities"] = {
	"prop_door_rotating",
	"func_door_rotating"
}
-- Entités sorties
GM.CONFIG["killerhelp_exit_entities"] = {
	"brush_car_1",
	"brush_car_2",
	"door_exit_1",
	"door_exit_2",
	"door_exit_3",
	"door_exit_4"
}
