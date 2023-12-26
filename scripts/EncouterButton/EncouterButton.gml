function EncouterButton() constructor {
	self.sprite = spr_empty;
	self.soul_offset = 0;
	self.visibility = true;
	
	static draw = function(hud, position, selected) {
		if (!visibility) return;
		
		draw_sprite(sprite, selected, position.x, position.y);
		
		if (selected) {
			draw_sprite(spr_ui_encouter_button_soul, 0, position.x + soul_offset, position.y);
		}
	}
	
	/// @param {Id.Instance} hud
	static draw_menu = function(hud) {
		throw new Exception();
	}
	
	static show = function() {
		visibility = true;
	}
	
	static hide = function() {
		visibility = false;
	}
}
