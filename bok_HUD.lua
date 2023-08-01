-- Main HUD script for GBA Boktai games

console.clear();

print("ROM Hash: " .. gameinfo.getromhash());
print("ROM Name: " .. gameinfo.getromname());
print("Game Info: " ..gameinfo.getboardtype());

-- Loads corresponding HUD based on which game is running
function load_HUD()

    local code = memory.read_u32_le(0x080000AC) & 0xFFFFFF;

    if(code == 4797269) then
        return dofile("bok1/HUD.lua");
    elseif(code == 3289941) then
        return dofile("bok2/HUD.lua");
    elseif(code == 3355477) then
        return dofile("bok3/HUD.lua");
    end;

    return nil;
end;

local hud = load_HUD();

if hud then
    hud.initialize();
    while true do
        -- hud.update();
        emu.frameadvance();
    end
else
    print("\nGame not recognized!\n");
    while true do
        emu.frameadvance(); -- idle until a new ROM is loaded
    end
end