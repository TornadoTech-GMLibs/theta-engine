function EncouterButton() constructor {
	self.sprite = spr_empty;
	self.soul_offset = 0;
	
	self.visibility = true;
	self.selectable = true;
	self.closing = false;
	
	static draw = function(hud, position, selected) {
		if (!visibility) return;
		
		selected = selected && hud.encouter.state == encouter_state.selecting;
		
		draw_sprite(sprite, selected, position.x, position.y);
		
		if (selected) {
			draw_sprite(spr_ui_encouter_button_soul, 0, position.x + soul_offset, position.y);
		}
	}
	
	/// @param {Id.Instance} input
	/// @return {Bool}
	static avaible = function(input) {
		return true;
	} 
	
	/// @param {Id.Instance} hud
	static draw_menu = function(hud) {
		throw new Exception();
	}
	
	/// @param {Id.Instance} hud
	static close = function(hud) {
		hud.input.close();
		closing = true;
	}

	/// @return {Struct.EncouterButton}
	static show = function() {
		visibility = true;
		return self;		
	}
	
	/// @return {Struct.EncouterButton}
	static hide = function() {
		visibility = false;
		return self;
	}
	
	/// @param {Bool} selectable
	/// @return {Struct.EncouterButton}
	static set_selectable = function(selectable) {
		self.selectable = selectable;
		return self;
	}
}
