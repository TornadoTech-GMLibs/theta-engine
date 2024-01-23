depth = encouter_depth.arena;

#region Methods

/// @param {Struct.Vector2} position
set_postion = function(position) {
	x = position.x;
	y = position.y;
}

/// @param {Real} width
/// @param {Real} height
set_size = function(width, height) {
	self.width = width;
	self.height = height;
	
	self.size = new Vector2(width, height);

	self.left = x - size.x / 2;
	self.right = x + size.x / 2;
	self.top = y - size.y / 2;
	self.bottom = y + size.y / 2;
}

set_size_dialogue = function() {
	set_size(dialogue_width, dialogue_height);
}

set_size_base = function() {
	set_size(base_width, base_height);
}

set_position_base = function() {
	set_postion(new Vector2(room_width / 2, room_height - 160));
}

#endregion

// Prestets
base_width = 580;
base_height = 116;

dialogue_width = 100;
dialogue_height = 100;

// Settings
border_instance = obj_encouter_arena_collision;
border_offset = 2;
border_size = 4;

// Sufrace 
surface = surface_create(room_width, room_height);

// Border
border = {
	up: instance_create_depth(x, y - base_height / 2 + border_offset, depth - 1, border_instance, {
		image_xscale: base_width / border_size,	
	}),
	down: instance_create_depth(x, y + base_height / 2 - border_offset, depth - 1, border_instance, {
		image_xscale: base_width / border_size,	
	}),
	left: instance_create_depth(x - base_width / 2 + border_offset, y, depth - 1, border_instance, {
		image_yscale: base_height / border_size,	
	}),
	right: instance_create_depth(x + base_width / 2 - border_offset, y, depth - 1, border_instance, {
		image_yscale: base_height / border_size,	
	}),
}

width = 0;
height = 0;
size = vector2_zero;

top = 0;
bottom = 0;
left = 0;
right = 0;

_width = 1;
_height = 1;

position = new Vector2(x, y);

set_size_base();
