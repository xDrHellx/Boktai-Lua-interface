-- Utilities

local utilities = {};

-- Verifies if a value is empty (nil, empty string, 0, false)
-- Based on PHP's empty() function
-- @param mixed value Value to verify
-- @return bool True | False if not nil and not empty string
function utilities.isEmpty(value)
	return value == nil or value == '' or value == 0 or value == false;
end;

-- Dumps data, useful for tables within tables
-- @param mixed data Data to dump
-- @param bool showAsArray True if print should look like arrays, other will be like JSON objects
-- @param int level Level for handling intentation with recursivity
function utilities.dump(data, showAsArray, level)

	-- Handling optional parameters
	showAsArray = (showAsArray and showAsArray or false);
	level = (level and level + 1 or 1);

	-- Adds more tabs based on the level to make things easier to look at
	local tabs = "";
	local tabsForClosure = "";
	for n = 0, level, 1 do
		tabsForClosure = tabs;
		tabs = tabs .. "  ";
	end;

	-- Start going through the data to print its content
   	if type(data) == 'table' then

      	local content = (showAsArray == true and "[" or "{");

      	for key, value in pairs(data) do
      		if showAsArray == true then
      			content = content .. (content == "[" and "\n" or ",\n") .. tabs .. key .. " => " .. utilities.dump(value, showAsArray, level)
  			else
      			content = content .. (content == "{" and "\n" or ",\n") .. tabs .. key .. " : " .. utilities.dump(value, showAsArray, level);
      		end;
  		end;

      	return content .. "\n" .. (level > 1 and tabsForClosure or "") .. (showAsArray == true and "]" or "}");
   	else
      	return tostring(data);
   	end;
end;

-- Retrieve the game code to know which game is running
-- @return string Game code
function utilities.getGameCode()
	return memory.read_u32_le(0x080000AC) & 0xFFFFFF;
end;

-- Retrieve value from a memory address
-- @param string address Memory address
-- @param string readType Type used for reading the address (u32_le, s16_le, ...)
-- @return mixed Value

	-- Handling optional parameters
	if (utilities.isEmpty(domain) == false) then

		-- If a domain is passed, add a comma and quotes
		-- because it will be passed as a second parameter in the function
		domain = ', "'..domain..'"';
	else
		domain = '';
	end;

	if (readType == nil or readType == '') then
		readType = 'u32_le';
	end;

	-- Set the the name & parameters for the function to use to get the value from the memory address
	local readingFunction = 'return memory.read_'..readType..'('..address..domain..')';

	-- Execute the function & return the value
end;

-- Sets a value for a memory address
-- @param int value Value to set
-- @param string address Memory address
-- @param string domain Memory domain
	
	-- Handling optional parameters
	if (utilities.isEmpty(domain) == false) then

		-- If a domain is passed, add a comma and quotes
		-- because it will be passed as a parameter in the function
		domain = ', "'..domain..'"';
	else
		domain = '';
	end;

	end;

	-- Set the name & parameters for the function to use to set the value for the memory address

	-- Execute the function
	else
	end;
end;

return utilities;