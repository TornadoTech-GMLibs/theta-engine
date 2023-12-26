var buttons_y = room_height - 40;

var buttons_x = room_width;
for (var i = 1; i < array_length(buttons); i++) {
	buttons_x -= buttons_offset_x + sprite_get_width(buttons[i].sprite);
}
buttons_x /= 2;

for (var i = 0; i < array_length(buttons); i++) {
	var button = buttons[i];
	var position = new Vector2(buttons_x + buttons_offset_x * i + 116 * i, buttons_y);
	var selected = true; //_input.selected_button == i && encouter.state == encouter_state.selecting;
	
	button.draw(id, position, selected);
}
