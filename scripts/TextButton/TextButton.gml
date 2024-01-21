/// @param {String} text
/// @param {Struct.Vector2} position
/// @param {Function} callback
function TextButton(text, position, callback) : UIElement() constructor {
	self.text = "";
	self.position = vector2_zero;
	self.callback = callback;
	
	self.hovered = false;
	
	self.scale = vector2_one;
	
	self.text_size = vector2_zero;
	self.text_size_half = vector2_zero;
	
	self.color = c_white;
	self.color_hover = c_yellow;
	
	self.top = 0;
	self.left = 0;
	self.right = 0;
	self.bottom = 0;
	
	self.set_text(text);
	self.set_position(position);
	
	/// @param {String} text
	/// @return {Struct.TextButton}
	static set_text = function(text) {
		self.text = text;

		update_size();
		update_bbox();
		return self;
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Struct.TextButton}
	static set_scale = function(vector) {
		self.scale.set(vector);
		
		update_size();
		update_bbox();
		return self;
	}
	
	/// @param {Struct.Vector2} vector
	/// @return {Struct.TextButton}
	static set_position = function(vector) {
		self.position.set(vector);
		
		update_bbox();
		return self;
	}
	
	static update_size = function() {
		self.text_size = new Vector2(
			string_width(text) * scale.x,
			string_height(text) * scale.y
		);
		
		self.text_size_half = new Vector2(
			text_size.x / 2,
			text_size.y / 2
		);
	}
	
	static update_bbox = function() {
		self.left = position.x - text_size_half.x; 
		self.right = position.x + text_size_half.x; 
		
		self.top = position.y - text_size_half.y; 
		self.bottom = position.y + text_size_half.y; 
	}
	
	static update = function() {
		var mouse_position = mouse_gui_position;
		hovered = point_in_rectangle(mouse_position.x, mouse_position.y, left, top, right, bottom);
		
		if (hovered && input_pressed(input_source.press)) {
			callback();
		}
	}
	
	static draw = function() {
		// draw_set_color(c_white);
		// draw_rectangle(left, top, right, bottom, true);
		
		scribble(text)
			.blend(hovered ? color_hover : color, 1)
			.align(fa_center, fa_middle)
			.transform(scale.x, scale.y, 0)
			.draw(position.x, position.y);
	}
	
	static render = function() {
		update();
		draw();
	}
}
