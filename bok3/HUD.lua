-- HUD script for Boktai 3, compatible with the english translation patch

local hud = {};

local utilities = dofile("all/utilities.lua");

-- Initializes the HUD
function hud.initialize()

	-- Get list of memory addresses
	hud.addresses = require("bok3/addresses");

	-- Starts recording inputs
	hud.buttons = require("bok3/buttons");

	-- Initializes interface shown on screen
	gui.addmessage('Initialized Shinbok Interface');
end;

-- Updates the HUD
function hud.update()
end;

return hud;