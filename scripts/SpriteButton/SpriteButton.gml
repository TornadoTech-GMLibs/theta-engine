/// @param {Asset.GMSprite} sprite
/// @param {Struct.Vector2} position
/// @param {Function} callback
function SpriteButton(sprite, position, callback) : UIElement() constructor {
	self.sprite = spr_empty
	self.position = vector2_zero;
	self.callback = callback;
	
	self.hovered = false;
	
	self.scale = vector2_one;
	
	self.sprite_origin = vector2_zero;
	self.sprite_size = vector2_zero;
	self.sprite_size_size_half = vector2_zero;
	
	self.color = c_white;
	self.color_hover = c_yellow;
	
	self.subming = 0;
	self.subming_hover = 1;
	
	self.top = 0;
	self.left = 0;
	self.right = 0;
	self.bottom = 0;
	
	self.set_sprite(sprite);
	self.set_position(position);
	
	/// @param {Asset.GMSprite} sprite
	/// @return {Struct.SpriteButton}
	static set_sprite = function(sprite) {
		self.sprite = sprite;

		update_origin();
		update_size();
		update_bbox();
		return self;
	}
	
	/// @param {Constant.Color} color
	/// @return {Struct.SpriteButton}
	static set_color = function(color, color_hover = self.color_hover) {
		self.color = color;
		self.color_hover = color_hover;
		return self;
	}
	
	/// @param {Real} subming
	/// @return {Struct.SpriteButton}
	static set_subming = function(subming, subming_hover = self.subming_hover) {
		self.subming = subming;
		self.subming_hover = subming_hover;
		return self;
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Struct.SpriteButton}
	static set_scale = function(vector) {
		self.scale = vector;

		update_size();
		update_bbox();
		return self;
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Struct.SpriteButton}
	static set_position = function(vector) {
		self.position = vector;

		update_bbox();
		return self;
	}
	
	
	static update_origin = function() {
		self.sprite_origin = new Vector2(
			sprite_get_xoffset(sprite),
			sprite_get_yoffset(sprite)
		);
	}
	
	static update_size = function() {
		self.sprite_size = new Vector2(
			sprite_get_width(sprite),
			sprite_get_height(sprite)
		).multi(scale);
		
		self.sprite_size_half = sprite_size.sdivis(2);
	}
	
	static update_bbox = function() {
		self.left = position.x - sprite_origin.x * scale.x;
		self.right = position.x + sprite_origin.x * scale.x;
		
		self.top = position.y - sprite_origin.y * scale.y;
		self.bottom = position.y + sprite_origin.y * scale.y;
	}
	
	static update = function() {
		var mouse_position = mouse_gui_position;
		hovered = point_in_rectangle(mouse_position.x, mouse_position.y, left, top, right, bottom);
		
		if (hovered && input_pressed(input_source.press)) {
			callback();
		}
	}
	
	static draw = function() {
		//draw_set_color(c_red);
		//draw_rectangle(left, top, right, bottom, true);
		
		draw_sprite_ext(
			sprite,
			hovered ? subming_hover : subming,
			position.x,
			position.y,
			scale.x,
			scale.y,
			0,
			hovered ? color_hover : color,
			draw_get_alpha()
		);
	}
}
