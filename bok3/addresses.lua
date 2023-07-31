-- List of memory addresses
-- Note : 	Due to how the game works, if values are modified,
-- 			the game will only use the new values after switching rooms
--			or reloading the room

local addresses = {};

-- Django addresses
--
-- /!\	About level and EXP :
--		- If the EXP is too high, level will keep increasing automatically
--		- EXP Until next level adjusts itself automatically
addresses.django = {};

addresses.django.hp									= 0x03C428;
addresses.django.ene								= 0x03C42C;
addresses.django.trc								= 0x03CA08;
addresses.django.stat_points_to_allocate			= 0x03C442;
addresses.django.level								= 0x03C440;
addresses.django.current_exp						= 0x03C448;
addresses.django.exp_until_next_level				= 0x001BC8;
addresses.django.vit								= 0x03C418;
addresses.django.spr								= 0x03C41A;
addresses.django.str								= 0x03C41C;

-- Solls
addresses.solls = {};

addresses.solls.solls_on_self						= 0x03CBB0;
addresses.solls.solar_bank							= 0x03C90C;
addresses.solls.dark_loan							= 0x03CB7C;

-- Bike
--
-- If HP & ENE are modified during races, the bars will update automatically
--
-- /!\	Freezing the scrolling value will NOT stop Django from moving
addresses.bike = {};

addresses.bike.points								= 0x03CBB2;
addresses.bike.hp									= 0x00F6F8;
addresses.bike.ene									= 0x00F6F4;
addresses.bike.scrolling							= 0x0004E0;

-- "Previous" values
--
-- These values are updating automatically when switching rooms
-- They are used to go back to previous values when continuing after dying
--
-- /!\	Freezing them to a different value that is different than the "current" values 
-- 		can cause the game to crash when switching rooms
addresses.previous = {};
addresses.previous.django = {};
addresses.previous.solls = {};
addresses.previous.bike = {};

-- "Previous" Django values
addresses.previous.django.hp						= 0x03CF28;
addresses.previous.django.trc						= 0x03D508;
addresses.previous.django.stat_points_to_allocate	= 0x021A4C;
addresses.previous.django.vit						= 0x03CF18;
addresses.previous.django.spr						= 0x03CF1A;
addresses.previous.django.str						= 0x03CF1C;
addresses.previous.django.level						= 0x03CF40;
addresses.previous.django.current_exp				= 0x03CF48;

-- "Previous" solls values
addresses.previous.solls.solls_on_self				= 0x03D6B0;
addresses.previous.solls.dark_loan					= 0x03D40C;
addresses.previous.solls.solar_bank					= 0x03D67C;

-- "Previous" bike values
addresses.previous.bike.points						= 0x03D6B2;
addresses.previous.bike.hp							= 0x006A44;

-- Returns addresses
return addresses;