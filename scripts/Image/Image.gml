/// @params {Asset.GMSprite} sprite 
/// @params {Real} subming 
/// @params {Real} x
/// @params {Real} y
function Image(sprite, subming = 0, x = 0, y = 0) constructor {
	self.subming = subming;
	self.sprite = sprite;
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
	alpha = 1;
	color = c_white;
	self.x = x;
	self.y = y;
	x1 = 0;
	x2 = 0;
	x3 = 0;
	x4 = 0;
	y1 = 0;
	y2 = 0;
	y3 = 0;
	y4 = 0;
	scale_x = 1;
	scale_y = 1;
	
	/// @param {Asset.GMSprite} sprite
	/// @return {Struct.Image}
	static set_sprite = function(sprite) {
		self.sprite = sprite;
		return self;
	}
	
	static set_psotiion = function(x1, y1, x2, y2, x3, y3, x4, y4) {
		self.x1 = x1;
		self.y1 = y1;
		self.x2 = x2;
		self.y2 = y2;
		self.x3 = x3;
		self.y3 = y3;
		self.x4 = x4;
		self.y4 = y4;
	}
	
	static draw = function() {
		draw_set_color(color);
		draw_sprite_pos(sprite, subming, x1, y1, x2, y2, x3, y3, x4, y4, alpha);
		draw_reset();
	}
}
