depth = encouter_depth.arena;

// Prestets
base_width = 580;
base_height = 116;

dialogue_width = 100;
dialogue_height = 100;

// Settings
border_instance = obj_encouter_arena_collision;
border_offset = 2;
border_size = 4;

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

width = base_width;
height = base_height;
_width = 1;
_height = 1;

position = new Vector2(x, y);

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
}

set_size_dialogue = function() {
	set_size(dialogue_width, dialogue_height);
}

set_size_base = function() {
	set_size(base_width, base_height);
}
