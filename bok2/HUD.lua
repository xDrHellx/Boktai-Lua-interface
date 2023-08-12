-- HUD script for Boktai 2

local hud = {};

local utilities = dofile("all/utilities.lua");

-- Initializes the HUD
function hud.initialize()

	-- Get list of memory addresses
	hud.addresses = require("bok2/addresses");

	-- Starts recording inputs
	-- hud.buttons = require("bok2/buttons");

	-- Initializes interface shown on screen
end;

-- Updates the HUD
function hud.update()
	
end;

return hud;