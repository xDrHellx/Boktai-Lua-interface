-- List & "states" of buttons
-- Mostly used for the HUD

local buttons = {};

-- Buttons pressed, previously pressed, holding down
	-- Controller
buttons.held = {};
buttons.previous = {};
buttons.down = {};
	-- Keyboard
buttons.keys = {};
buttons.keys.held = {};
buttons.keys.previous = {};
buttons.keys.down = {};

local function processInputs()

	-- Get buttons pressed for both controller & keyboard
	buttons.held = joypad.get(); 		-- controller
	buttons.keys.held = inputs.get(); 	-- keyboard

	-- Update each button if it has changed
	-- For example releasing the A button after holding it down
		-- Controller
	buttons.down.Up = (buttons.held.Up and not buttons.previous.Up);
	buttons.down.Down = (buttons.held.Down and not buttons.previous.Down);
	buttons.down.Left = (buttons.held.Left and not buttons.previous.Left);
	buttons.down.Right = (buttons.held.Right and not buttons.previous.Right);
	buttons.down.Start = (buttons.held.Start and not buttons.previous.Start);
	buttons.down.Select = (buttons.held.Select and not buttons.previous.Select);
	buttons.down.A = (buttons.held.A and not buttons.previous.A);
	buttons.down.B = (buttons.held.B and not buttons.previous.B);
	buttons.down.L = (buttons.held.L and not buttons.previous.L);
	buttons.down.R = (buttons.held.R and not buttons.previous.R);
	buttons.down.Power = (buttons.held.Power and not buttons.previous.Power);
	-- buttons.down.Reset = (buttons.held.Reset and not buttons.previous.Reset);

		-- Keyboard
	buttons.keys.down.Up           = (buttons.keys.held.Up           and not buttons.keys.previous.Up          );
    buttons.keys.down.Down         = (buttons.keys.held.Down         and not buttons.keys.previous.Down        );
    buttons.keys.down.Left         = (buttons.keys.held.Left         and not buttons.keys.previous.Left        );
    buttons.keys.down.Right        = (buttons.keys.held.Right        and not buttons.keys.previous.Right       );
    buttons.keys.down.Tab          = (buttons.keys.held.Tab          and not buttons.keys.previous.Tab         );
    buttons.keys.down.Keypad0      = (buttons.keys.held.Keypad0      and not buttons.keys.previous.Keypad0     );
    buttons.keys.down.Keypad1      = (buttons.keys.held.Keypad1      and not buttons.keys.previous.Keypad1     );
    buttons.keys.down.Keypad2      = (buttons.keys.held.Keypad2      and not buttons.keys.previous.Keypad2     );
    buttons.keys.down.Keypad3      = (buttons.keys.held.Keypad3      and not buttons.keys.previous.Keypad3     );
    buttons.keys.down.Keypad4      = (buttons.keys.held.Keypad4      and not buttons.keys.previous.Keypad4     );
    buttons.keys.down.Keypad5      = (buttons.keys.held.Keypad5      and not buttons.keys.previous.Keypad5     );
    buttons.keys.down.Keypad6      = (buttons.keys.held.Keypad6      and not buttons.keys.previous.Keypad6     );
    buttons.keys.down.Keypad7      = (buttons.keys.held.Keypad7      and not buttons.keys.previous.Keypad7     );
    buttons.keys.down.Keypad8      = (buttons.keys.held.Keypad8      and not buttons.keys.previous.Keypad8     );
    buttons.keys.down.Keypad9      = (buttons.keys.held.Keypad9      and not buttons.keys.previous.Keypad9     );
    buttons.keys.down.KeypadPeriod = (buttons.keys.held.KeypadPeriod and not buttons.keys.previous.KeypadPeriod);

	-- Update previous buttons pressed
	buttons.previous = buttons.held;
	buttons.keys.previous = buttons.keys.held;
end;

-- Process inputs on frame start
buttons.processInputs = event.onframestart(processInputs, "processInputs");

return buttons;