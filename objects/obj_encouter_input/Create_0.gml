event_inherited();

close = function() {
	encouter.set_state(encouter_state.selecting);
	selected_menu = undefined;
}

button_length = array_length(encouter.buttons);

selected_button = 0;
selected_menu = undefined;
