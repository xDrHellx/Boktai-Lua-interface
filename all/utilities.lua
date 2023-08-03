-- Utilities

local utilities = {};

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

-- Retrieve value from a memory address
-- @param string address Memory address
-- @param string domain Domain
-- @return mixed Value
function utilities.getValueFromMemory(address, domain)

	-- Handling optional parameters	& returning value
	domain = (domain and domain or 0xFFFFFF);
 	return memory.read_u32_le(address) & domain;
end;

return utilities;