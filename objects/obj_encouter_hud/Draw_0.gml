var buttons_x = room_width;
var buttons_y = room_height - 40;

for (var i = 1; i < array_length(buttons); i++) {
	buttons_x -= buttons_offset_x + sprite_get_width(buttons[i].sprite);
}

buttons_x /= 2;

for (var i = 0; i < array_length(buttons); i++) {
	var button = buttons[i];
	var position = new Vector2(buttons_x + buttons_offset_x * i + 116 * i, buttons_y);
	var selected = input.selected_button == i; // && encouter.state == encouter_state.selecting;
	
	button.draw(id, position, selected);
}

// Draw text
if (encouter.state = encouter_state.selecting) {
	if (input.selected_menu == undefined) {
		scribble(encouter.text)
			.starting_format("font_determination", c_white)
			.transform(2, 2, 0)
			.wrap(arena.width - text_offset_x)
			.line_height(16, 16)
			.draw(arena.x - arena.width / 2 + text_offset_x, arena.y - arena.height / 2 + text_offset_y, typist);
	} else {
		buttons[input.selected_menu].draw_menu(id);
	}
}

// Draw HUD
var player = encouter.player;

var hud_x = room_width / 2 - 270;
var hud_y = room_height - 95;

// Name
scribble(player.name)
	.starting_format("font_hud", c_white)
	.draw(hud_x, hud_y);

// LV
scribble($"LV{player.lv}")
	.starting_format("font_hud", c_white)
	.draw(hud_x + 130, hud_y);

// Heatlh label
scribble("hp")
	.starting_format("font_hud", c_white)
	.draw(hud_x + 240, hud_y);

// Heatlh bar
draw_sprite(spr_ui_encouter_bar_background, 0, hud_x + 280, hud_y + 12);
draw_sprite_field(spr_ui_encouter_bar_hp, 0, hud_x + 280, hud_y, player.hp / player.hp_max);

// Real health
scribble($"{player.hp}/{player.hp_max}")
	.starting_format("font_hud", c_white)
	.draw(hud_x + 390, hud_y);