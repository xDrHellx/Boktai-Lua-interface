-- HUD script for Boktai 1

local hud = {};

local utilities = dofile("all/utilities.lua");

-- Initializes the HUD
function hud.initialize()

	-- Get list of memory addresses
	hud.addresses = require("bok1/addresses");

	-- Starts recording inputs
	-- hud.buttons = require("bok1/buttons");

	-- Initializes interface shown on screen
	gui.addmessage('Initialized Boktai Interface');
end;

-- Updates the HUD
function hud.update()
	
end;

return hud;