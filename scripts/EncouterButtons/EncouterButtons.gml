function EncouterButtonFight() : EncouterButton() constructor {
	self.sprite = spr_ui_encouter_button_fight;
	self.soul_offset = -36;
	self.selection = 0;
	self.enemy_selected = undefined;
	
	/// @param {Id.Instance} hud
	static update_input = function(hud) {
		var encouter = hud.encouter;
		var enemies = encouter.enemies_instance;
		
		if (input_pressed(input_source.select)) {
			encouter.set_state(encouter_state.atacking);
			enemy_selected = selection;
			
			instance_create(obj_encouter_attack, {
				encouter: encouter,
				target: enemy_selected,
			});
		}
		
		if (enemy_selected != undefined) return;
		
		if (input_pressed(input_source.up) && selection > 0) {
			selection--;
		}
	
		if (input_pressed(input_source.down) && selection < array_length(enemies) - 1) {
			selection++;
		}
	}
	
	/// @param {Id.Instance} hud
	static draw_menu = function(hud) {
		update_input(hud);
		
		var encouter = hud.encouter;
		var arena = hud.arena;
		var enemies = encouter.enemies_instance;
		
		if (enemy_selected != undefined) return;
		
		var text_offset_x = hud.text_offset_x;
		var text_offset_y = hud.text_offset_y;
		var text = "";

		for (var i = 0; i < array_length(enemies); i ++) {
			var enemy = enemies[i];
			var bar_offset_x = 16;
			var bar_offset_y = 34;
			var bar_draw_x = arena.x - arena.width / 2 + bar_offset_x;
			var bar_draw_y = arena.y - arena.height / 2 + bar_offset_y + 32 * i;
			var soul_offset_x = 12;
			var soul_offset_y = 0;
			var name = enemy.name;
		
			// Draw enemy hp bar
			draw_sprite(spr_ui_encouter_menu_bar_background, 0, bar_draw_x + 350, bar_draw_y - 14);
			draw_sprite_field(spr_ui_encouter_menu_bar_hp, 0, bar_draw_x + 350, bar_draw_y - 14, enemy.hp / enemy.hp_max);
		
			// Draw soul & generate text
			if (selection == i) {
				draw_sprite(spr_ui_encouter_button_soul, 0, bar_draw_x + soul_offset_x, bar_draw_y + soul_offset_y);
				text += "    ";
			} else {
				text += "* ";
			}
				
			text += name + "\n";
		}

		// Draw enemy names
		scribble(text)
			.transform(2, 2, 0)
			.line_height(16, 16)
			.draw(arena.x - arena.width / 2 + text_offset_x, arena.y - arena.height / 2 + text_offset_y);
	}
}

function EncouterButtonAct() : EncouterButton() constructor {
	self.sprite = spr_ui_encouter_button_act;
	self.soul_offset = -30;
	
	/// @param {Id.Instance} hud
	static draw_menu = function(hud) {
		
	}
}

function EncouterButtonItem() : EncouterButton() constructor {
	self.sprite = spr_ui_encouter_button_item;
	self.soul_offset = -34;
	
	/// @param {Id.Instance} hud
	static draw_menu = function(hud) {
		
	}
}


function EncouterButtonMercy() : EncouterButton() constructor {
	self.sprite = spr_ui_encouter_button_mercy;
	self.soul_offset = -38;
	
	/// @param {Id.Instance} hud
	static draw_menu = function(hud) {
		
	}
}

