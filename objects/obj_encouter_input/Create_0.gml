event_inherited();

close = function() {
	encouter.set_state(encouter_state.selecting);
	selected_menu = undefined;
}

/// @param {Real} index
/// @param {Real} dir
select_button = function(index, dir = sign(index - selected_button)) {
	var button = buttons[index];
	if (button.selectable) {
		selected_button = index;
		return;
	}
	
	// Unselectable logic
	if (dir == 0) // TODO: Add debug logic 
		return;
	
	var next_index = index + dir;
	
	while (true) {
		if (next_index < 0 || next_index > button_length - 1)
			break;
			
		var next_button = buttons[next_index];
		
		if (next_button.selectable) {
			selected_button = next_index;
			break;
		}
		
		next_index += dir;
	}
}

buttons = encouter.buttons;
button_length = array_length(buttons);

selected_button = 0;
selected_menu = undefined;

// Init
select_button(0, 1); // 1 - direction right
